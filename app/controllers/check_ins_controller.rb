class CheckInsController < ApplicationController
  # before_action :check_in_params, only: :create

  def create
    # render plain: params
    venue = Venue.find params[:venue_id] #why format?
    current_user.check_in! venue
	 	
    gon.push({
       :lat => venue.lat,
       :lng => venue.lng
    })

    redirect_to :back
  end

  def destroy
  end


  private

  def check_in_params
    params.require(:check_in).permit(:venue_id)
  end

end
