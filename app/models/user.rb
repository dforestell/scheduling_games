class User < ActiveRecord::Base
  has_many :games, foreign_key: :host_id
  has_many :games, foreign_key: :traveler_id
end
