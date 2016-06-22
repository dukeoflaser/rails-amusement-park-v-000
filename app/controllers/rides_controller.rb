class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    ride.take_ride
    
    if ride.eligable?
      ride.save
      flash[:success] = "Thanks for riding the #{ride.attraction_name}!"
    else
      flash[:notice] = ride.message
    end
    
    redirect_to user_path(current_user)
  end
  
  def ride_params
    user_id = current_user.id
    attraction_id = params.require(:attraction)[:id]
    
    {attraction_id: attraction_id, user_id: user_id}
  end
end