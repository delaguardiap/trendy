class CheckInsController < ApplicationController
  #before_action :check_in_params, only: :create
  include SessionsHelper

  def create
    venue = Venue.find params[:venue_id] #why format?
    current_user.check_in! venue, params[:review], params[:rating]
	 	
    gon.push({
       :lat => venue.lat,
       :lng => venue.lng
    })


    
    redirect_to :back
  end

  def destroy
  end

  def vote_submit
    CheckIn.find(params[:check_in]).upvote! current_user
    redirect_to :back
  end

  private

  def check_in_params
    params.require(:check_in).permit(:venue_id, :review, :rating)
  end

end
