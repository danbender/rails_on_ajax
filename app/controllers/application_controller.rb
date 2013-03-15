class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticated?
    if current_user.blank?
      if request.xhr?
        render :json => new_user_session_path, :status => :unauthorized
      else
        redirect_to root_url unless user_signed_in?
      end
    end
  end
end
