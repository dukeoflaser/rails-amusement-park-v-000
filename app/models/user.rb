class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  # validates :name, :height, :happiness,
  #           :tickets, :password,
  #           presence: true
end
