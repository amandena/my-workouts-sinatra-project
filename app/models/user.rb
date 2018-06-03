class User < ActiveRecord::Base
  has_secure_password
  has_many :workouts
  validates :email, presence: true
  validates :email, uniqueness: true
end
