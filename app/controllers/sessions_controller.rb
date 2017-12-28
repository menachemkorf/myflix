class SessionsController < ApplicationController
  def new
    redirect_to(home_path) if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect_to home_path, notice: "You are signed in, enjoy!"
    else
      flash[:error] = "Invalid username or password."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:notice] = "You've logged out."
    redirect_to root_path, notice: "You are signed out."
  end
end