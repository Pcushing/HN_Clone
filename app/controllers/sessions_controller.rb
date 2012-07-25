class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        sign_in user
        flash[:message] = "Logged in!"
        redirect_back_or root_path
      else
        flash[:error] = "Login failed! Please try again!"
        render 'new'
      end
  end

  def destroy
    sign_out
    flash[:message] = "See ya later alligator"
    redirect_to root_path
  end
end