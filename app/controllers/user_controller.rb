class UserController < ApplicationController
 get '/signup' do
   if !logged_in
     erb :'/users/signup'
   else
     redirect '/workouts'
   end
 end

 post '/signup' do
   if @user = User.create(params)
     session[:user_id] = @user.id
     redirect '/workouts'
   else
     redirect '/signup'
   end
 end

 get '/login' do
   if !logged_in
     erb :'/users/login'
   else
     redirect '/workouts'
   end
 end

 post '/login' do
   @user = User.find_by(email: params[:email])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect '/workouts'
   else
     redirect '/signup'
   end
 end
end
