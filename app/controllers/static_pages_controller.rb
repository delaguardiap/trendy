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
      flash.now[:success] = "Success!"
    else 
      flash.now[:failure] = "Search cannot be empty"
    end
    render "home"
  end

end
