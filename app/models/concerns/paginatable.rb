module Paginatable
  extend ActiveSupport::Concern

  MIN_PAGE_SIZE = 1
  MAX_PAGE_SIZE = 100

  module ClassMethods
    def paginate(params)
      page = params[:page].to_i
      limit = params[:limit].to_i
      limit.between?(MIN_PAGE_SIZE, MAX_PAGE_SIZE) || limit = MAX_PAGE_SIZE
      values = self.limit(limit).offset(page * limit)
      { values: ActiveModelSerializers::SerializableResource.new(values),
        page: page,
        limit: limit }
    end
  end
end
