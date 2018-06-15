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

  get '/workouts/:id/edit' do
    if logged_in
      @workout = Workout.find_by_id(params[:id])
      erb :'/workouts/edit_workout'
    else
      redirect '/login'
    end
  end

  patch '/workouts/:id' do
    if logged_in
      @workout = Workout.find_by_id(params[:id])
      if @workout && @workout.user == current_user
        if @workout.update(exercise_name: params[:exercise_name], minutes: params[:minutes], water_intake: params[:water_intake], date: params[:date])
          redirect "/workouts/#{@workout.id}"
        else
          redirect "/workouts/#{@workout.id}/edit"
        end
      else
        redirect '/workouts'
      end
    else
      redirect '/login'
    end
  end
end
