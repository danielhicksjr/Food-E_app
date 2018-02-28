class SessionsController < ApplicationController
  def new
    p session[:user_id]
  end

  def create
   @user = User.find_by_email(params[:email])
   if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to posts_path
   else 
    redirect_to new_session_path
   end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
