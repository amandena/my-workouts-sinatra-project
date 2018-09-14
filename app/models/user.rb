class User < ActiveRecord::Base
  has_secure_password
  has_many :workouts

  include ActiveModel::Validations
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def create_username
    username = self.email.split("@")
    username[0]
  end

  def self.find_by_username(username)
    self.all.find {|email| email.create_username == username}
  end
  
  def total_minutes
    self.workouts.collect do |workout|
      workout.minutes
    end.reduce(:+)
  end
end
