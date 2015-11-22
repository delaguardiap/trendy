class CheckInsController < ApplicationController
  def create
	  if current_user.check_ins.count != 0
	  	current_user.check_ins.last.update_column(:active, false)
	    CheckIn.create(user_id: current_user.id, venue_id: params[:format], active: true)
	  else
	  	CheckIn.create(user_id: current_user.id, venue_id: params[:format], active: true)
	 	end
	 		@venue = Venue.find params[:format]
	 	gon.push({
       :lat => @venue.lat,
       :lng => @venue.lng
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
