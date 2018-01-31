class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if enough_tickets && tall_enough
      start_ride
    elsif !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else !enough_tickets && !tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
    #user not having enough tickets
    #user not tall enough
    #updates ticket number
    #updates user nausea, happiness
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough
    self.user.height >= self.attraction.min_height
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
      self.user.update( :happiness => new_happiness,
                        :nausea => new_nausea,
                        :tickets => new_tickets  )
    "Thanks for riding the #{attraction.name}!"
  end

end
