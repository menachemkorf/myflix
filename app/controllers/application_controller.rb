class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    deny_access unless logged_in?
  end

  def deny_access
    flash[:error] = 'You canot do that.'
    redirect_to root_path
  end
end
