class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, :through => :rides

  def mood
    if sad = self.nausea > self.happiness
      "sad"
    else happy = self.happiness > self.nausea
      "happy"
    end
    #returns sad when user is more nauseous than happy
    #returns happy when user is more happy than nauseous
  end

  def num_of_rides
    self.attractions.count
  end

end
