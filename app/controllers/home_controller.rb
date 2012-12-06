class HomeController < ApplicationController
  def index
    @goal  = current_user.goals.current

    if @goal.completed?
      render "shipped"
    elsif @goal.planned?
      render "track_goal"
    else
      render "index"
    end
  end

  def commit
    current_user.goals.plan(params[:goal])
    redirect_to "/"
  end

  def shipped
    goal = current_user.goals.current

    if params[:commit][/shipped/]
      goal.complete
    else
      goal.abandon
    end

    redirect_to "/"
  end

  def reset
    current_user.goals.create(:state => "undefined")

    redirect_to "/"
  end
end
