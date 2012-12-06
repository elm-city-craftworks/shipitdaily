class HomeController < ApplicationController
  def index
    @goal  = current_user.goals.where("created_at > ?", Date.today - 1).first

    if @goal && @goal.completed
      render "shipped"
    elsif @goal
      render "track_goal"
    else
      render "index"
    end
  end

  def commit
    current_user.goals.create(:description => params[:goal])

    redirect_to "/"
  end

  def shipped
    goal = current_user.goals.where("created_at > ?", Date.today - 1).first

    if params[:commit][/shipped/]
      goal.update_attribute(:completed, true)
    else
      goal.destroy
    end

    redirect_to "/"
  end

  def reset
    goal   = current_user.goals.where("created_at > ?", Date.today - 1).destroy_all

    redirect_to "/"
  end
end
