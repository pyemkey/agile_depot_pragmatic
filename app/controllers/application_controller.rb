class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :date_loaded
  protect_from_forgery with: :exception

  def date_loaded
  	t = Time.now
  	t.strftime("%F %H:%M")
  end
end
