class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:message] = "You're in!  Aren't you lucky?!"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong.  Give it another try."
      render new_user_path
    end
  end
end
