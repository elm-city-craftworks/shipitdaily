class HomeController < ApplicationController
  def index
    person = Person.find_or_create_by_uid(session[:identity])
    @goal  = person.goals.where("created_at > ?", Date.today - 1).first

    if @goal && @goal.completed
      render "shipped"
    elsif @goal
      render "track_goal"
    else
      render "index"
    end
  end

  def commit
    person = Person.find_or_create_by_uid(session[:identity])
    person.goals.create(:description => params[:goal])

    redirect_to "/"
  end

  def shipped
    person = Person.find_or_create_by_uid(session[:identity])
    goal = person.goals.where("created_at > ?", Date.today - 1).first

    if params[:commit][/shipped/]
      goal.update_attribute(:completed, true)
    end

    redirect_to "/"
  end

  def reset
    person = Person.find_or_create_by_uid(session[:identity])
    goal   = person.goals.where("created_at > ?", Date.today - 1).destroy_all

    redirect_to "/"
  end
end
