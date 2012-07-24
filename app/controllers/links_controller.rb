class LinksController < ApplicationController
  include SessionsHelper

  def new
    if signed_in?
      @link = Link.new
    else
      flash[:message] = "You must sign in to post links"
      redirect_to '/sessions/new'
    end
  end

  def index
    @links = Link.order("created_at").page(params[:page])
  end

  # def show
  #   @link = Link.find(params[:id]
  # end

  def create
    @link = Link.new(params[:link])
    @link.user_id = current_user.id

    if @link.save
      flash[:message] = "You rock!  You made a link."
      redirect_to root_path
    else
      flash[:error] = "You messed up.  Try again."
      render new_link_path
    end
  end

  def edit
    @link = Link.find(params[:id])
    redirect_to root_path if current_user.id != @link.user_id
  end

  def update
    @link = Link.find(params[:id])
    puts "T"*50
    puts current_user.id

    @link.user_id = current_user.id
    if @link.update_attributes(params[:link])
      flash[:message] = "Link updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

end
