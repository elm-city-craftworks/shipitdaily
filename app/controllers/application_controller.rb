class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :establish_identity

  def establish_identity
    session[:identity] ||= SecureRandom.uuid
  end
end
