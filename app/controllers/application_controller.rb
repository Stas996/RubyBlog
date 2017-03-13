class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def current_user
      User.where(id: session[:user_id]).first
    end

    def logged_in?
	  unless current_user 
	    redirect_to login_path
	  end
	end

    helper_method :current_user, :logged_in?
end
