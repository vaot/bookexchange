class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  include AuthSystem

  def session_path(scope)
    new_user_session_path
  end
  helper_method :session_path
end
