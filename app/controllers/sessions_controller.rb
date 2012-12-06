class SessionsController < ApplicationController
  def create
    render :text => auth_hash["uid"]   
  end

  def auth_hash
    hash = request.env['omniauth.auth']
    hash['uid'] = hash['uid'].to_s

    hash
  end
end
