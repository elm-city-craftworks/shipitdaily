class HomeController < ApplicationController
  def index
    return render "shipped"    if session[:shipped]
    return render "track_goal" if session[:goal]
  end

  def commit
    session[:goal] = params[:goal]
    redirect_to "/"
  end

  def shipped
    if params[:commit][/shipped/]
      session[:shipped] = true
    else
      redirect_to "/"
    end
  end

  def reset
    session[:shipped] = nil
    session[:goal] = nil

    redirect_to "/"
  end
end
