class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides
  
  def mood
    feeling = 'happy'
    
    if nausea && happiness
      feeling = 'sad' if self.nausea > self.happiness
    end
    
    feeling
  end
end
