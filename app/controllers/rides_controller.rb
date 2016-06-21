class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    ride.take_ride
    ride.save
    redirect_to user_path(current_user)
  end
  
  def ride_params
    user_id = current_user.id
    attraction_id = params.require(:attraction)[:id]
    
    {attraction_id: attraction_id, user_id: user_id}
    # params[:attraction][:user] = current_user
    # binding.pry
    # params.require(:attraction).permit(:id, :user)
  end
end