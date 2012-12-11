class PeopleController < ApplicationController
  def edit
    @person = current_user
  end

  def update
    current_user.update_attributes(params[:person])
    redirect_to "/"
  end
end
