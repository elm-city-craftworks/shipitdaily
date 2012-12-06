class SessionsController < ApplicationController
  def create
    raise auth_hash.inspect   
  end

  def auth_hash
    hash = request.env['omniauth.auth']
    hash['uid'] = hash['uid'].to_s

    hash
  end
end
