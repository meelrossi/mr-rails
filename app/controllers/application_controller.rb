class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Wor::Authentication::Controller
  before_action :authenticate_request
  protect_from_forgery with: :null_session

  MIN_PAGE_SIZE = 1
  MAX_PAGE_SIZE = 100

  def authenticate_entity(params)
    entity = User.find_by(email: params[:email])
    return nil unless entity.present? && entity.valid_password?(params[:password])
    entity
  end

  ENTITY_KEY = :entity_email

  def entity_payload(entity)
    { ENTITY_KEY => entity.email }
  end

  def find_authenticable_entity(entity_payload_returned_object)
    User.find_by(email: entity_payload_returned_object.fetch(ENTITY_KEY))
  end

  def entity_custom_validation_value(entity)
    entity.trackable_value
  end

  def entity_custom_validation_invalidate_all_value(entity)
    entity.trackable_value = Devise.friendly_token
    entity.save
  end

  def paginate(rel)
    page = params[:page].to_i
    limit = params[:limit].to_i
    limit.between?(MIN_PAGE_SIZE, MAX_PAGE_SIZE) || limit = MAX_PAGE_SIZE
    values = rel.limit(limit).offset(page * limit)
    { values: ActiveModelSerializers::SerializableResource.new(values),
      page: page,
      limit: limit }
  end
end
