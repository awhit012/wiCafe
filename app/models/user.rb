# require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence:     true
  validates :password_hash, presence: true,
                    length: {minimum: 6, maximum: 30}
  validates :email, presence:    true,
                    uniqueness:  true,
                    format:     {with: /@/}
  # include BCrypt

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
end
