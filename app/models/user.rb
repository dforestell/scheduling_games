require 'bcrypt'
class User < ActiveRecord::Base
  has_many :hosted_games, class_name: :Game, foreign_key: :host_id
  has_many :away_games, class_name: :Game, foreign_key: :traveler_id


validates :email, presence: true
validates :email, uniqueness: true
validate :validate_password

def validate_password
  	if @raw_password.nil?
  		errors.add(:password, "is required")
  	elsif @raw_password.length < 6
  		errors.add(:password, "must be 6 characters or more")
  	end
  end

  def password
  	@password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
  	@raw_password = new_password
  	@password = BCrypt::Password.create(new_password)
  	self.password_hash = @password
  end

  def authenticate(password)
  	self.password == password
  end
end
