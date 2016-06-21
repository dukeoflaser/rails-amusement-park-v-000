class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  
  def take_ride
    check_if_eligable
    
    if @eligable
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    end
    
    @message
  end
  
  private
  def check_if_eligable
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      @eligable = false
      @message = "Sorry. #{ticket_decline_message} #{height_decline_message}"
    elsif user.tickets < attraction.tickets
      @eligable = false
      @message = "Sorry. #{ticket_decline_message}"
    elsif user.height < attraction.min_height
      @eligable = false
      @message = "Sorry. #{height_decline_message}"
    else
      @eligable = true
    end
  end
  
  def ticket_decline_message
    "You do not have enough tickets for the #{attraction.name}."
  end
  
  def height_decline_message
    "You are not tall enough to ride the #{attraction.name}."
  end
end
