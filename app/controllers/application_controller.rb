class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
    if current_user.blank?
      if request.xhr?
        render :json => new_user_session_path, :status => :unauthorized
      else
        redirect_to root_url unless user_signed_in?
      end
    end
  end
end
