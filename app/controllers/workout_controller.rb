class WorkoutController < ApplicationController
  get '/workouts' do
    if logged_in
      @workouts = Workout.all
      erb :'/workouts/workouts'
    else
      redirect '/login'
    end
  end

  get '/workouts/new' do
    if logged_in
      erb :'/workouts/create_workout'
    else
      redirect '/login'
    end
  end

  post '/workouts' do
    if logged_in
      if @workout = current_user.workouts.create(params)
        redirect "/workouts/#{@workout.id}"
      else
        redirect '/workouts/new'
      end
    else
      redirect '/login'
    end
  end

  get '/workouts/:id' do
    if logged_in
      @workout = Workout.find_by_id(params[:id])
      erb :'/workouts/show_workout'
    else
      redirect '/login'
    end
  end
end
