class SessionsController < ApplicationController
  skip_before_filter :authorize_user, :only => :create

  def create
    Person.find_or_create_by_uid(auth_hash["uid"])
    session[:identity] = auth_hash["uid"]

    redirect "/"
  end

  private

  def auth_hash
    hash = request.env['omniauth.auth']
    hash['uid'] = hash['uid'].to_s

    hash
  end
end
