# require 'bcrypt'

class User < ActiveRecord::Base

  scope :hosts, -> { where("cafe_location is not null") }

  validates :username, presence: true

end
