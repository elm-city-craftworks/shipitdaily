class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize_user, :set_timezone

  private

  def set_timezone
    if current_user && current_user.time_zone.present?
      Time.zone = current_user.time_zone
    else
      Time.zone = "UTC"
    end
  end

  def login_path
    Rails.env.development? ? '/auth/developer' : '/auth/twitter'
  end
    
  def authorize_user
    redirect_to login_path unless session[:identity] 
  end

  def current_user
    Person.find_by_uid(session[:identity])
  end
end
