class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Wor::Authentication::Controller
  before_action :authenticate_request
  protect_from_forgery with: :null_session
  attr_reader :current_user

  rescue_from Wor::Authentication::Exceptions::NotRenewableTokenError,
              with: :render_not_renewable_token
  rescue_from Wor::Authentication::Exceptions::ExpiredTokenError,
              with: :render_expired_token
  rescue_from Wor::Authentication::Exceptions::EntityCustomValidationError,
              with: :render_entity_invalid_custom_validation

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
    @current_user ||= User.find_by(email: entity_payload_returned_object.fetch(ENTITY_KEY))
  end

  def entity_custom_validation_value(entity)
    entity.trackable_value
  end

  def entity_custom_validation_invalidate_all_value(entity)
    entity.trackable_value = Devise.friendly_token
    entity.save
  end
end
