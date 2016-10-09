# ApplicationController
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate, if: :should_authenticate?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def should_authenticate?
    ENV['AUTH_USERNAME'].present? && ENV['AUTH_PASSWORD'].present?
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['AUTH_USERNAME'] && password == ENV['AUTH_PASSWORD']
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
