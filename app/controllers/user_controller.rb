class UserController < ApplicationController
 get '/signup' do
   if !logged_in
     erb :'/users/signup'
   else
     redirect '/workouts'
   end
 end

 post '/signup' do
   @user = User.create(params)
   if @user.valid?
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
   if @user.valid?
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect '/workouts'
     else
       redirect '/signup'
     end
   else
     redirect '/login'
   end
 end

 get '/logout' do
   if logged_in
     session.destroy
     redirect '/login'
   else
     redirect '/'
   end
 end

 get '/users/:username' do
   @user = User.find_by_username(params[:username])
   erb :'/users/show'
 end
end
