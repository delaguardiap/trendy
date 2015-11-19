class StaticPagesController < ApplicationController
  before_action :user_logged_in?

  def home
  end

  def about
  end

  def contact
  end

  def search
    unless params[:q] == ""
      flash.now[:failure] = "Success!"
    else 
      flash.now[:success] = "Search cannot be empty"
    end
    render "home"
  end

  def user_logged_in?
    unless logged_in?
      render 'sessions/new'
    end
  end

end
