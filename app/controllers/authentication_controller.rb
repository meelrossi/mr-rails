class AuthenticationController < ApplicationController
  include Wor::Authentication::SessionsController
  skip_before_action :authenticate_request, only: [:create]
  rescue_from Wor::Authentication::Exceptions::ExpiredTokenError do
    render json: { error: 'Expired token' }, status: 401
  end
end
