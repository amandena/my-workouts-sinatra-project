class Workouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :exercise_name
      t.integer :minutes
      t.string :water_intake
      t.string :date
      t.integer :user_id
    end
  end
end
