class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize_user

  private

  def authorize_user
    redirect_to "/auth/twitter" unless session[:identity] 
  end

  def current_user
    Person.find_by_uid(session[:identity])
  end
end
