class Workout < ActiveRecord::Base
  belongs_to :user

  include ActiveModel::Validations
  validates :exercise_name, presence: true
  validates :minutes, presence: true
  validates :water_intake, presence: true
  validates :date, presence: true
end
