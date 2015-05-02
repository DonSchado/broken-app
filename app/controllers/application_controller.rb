class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # filters
  before_filter :require_login

  # helpers
  helper_method :current_user
  helper_method :logged_in?

  private

  def not_authenticated
    redirect_to [:new, :session], alert: 'Y U NO authenticate?'
  end

end
