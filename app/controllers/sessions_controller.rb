class SessionsController < ApplicationController

 def new
  session[:test] = "value"
 end

 # Authentication logic
 def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    redirect_to root_path, notice: "logged in!"
  else
   flash.now.alert = "invalid login credentials"
   render "new"  # sessions#new
  end

 end

 def destroy
  session[:user_id] = nil
  redirect_to login_path, notice: "logged out!"
 end

end
