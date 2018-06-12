class WorkoutController < ApplicationController
  get '/workouts' do
    if logged_in
      @workouts = Workout.all
      erb :'/workouts/workouts'
    else
      redirect '/login'
    end
  end
end
