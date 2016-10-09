# ApplicationController
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate, if: :should_authenticate?

  protected

  def should_authenticate?
    ENV['AUTH_USERNAME'].present? && ENV['AUTH_PASSWORD'].present?
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['AUTH_USERNAME'] && password == ENV['AUTH_PASSWORD']
    end
  end
end
