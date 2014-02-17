class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize, :set_i18n_locale_from_params
  helper_method :date_loaded, :counter
  protect_from_forgery with: :exception

  def date_loaded
  	t = Time.now
  	t.strftime("%F %H:%M")
  end

  def counter
  	session[:counter] ||= 0
  end

  def increment_counter
			counter			
			session[:counter] += 1
	end

	def reset_counter
		session[:counter] = nil
	end

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end
end
