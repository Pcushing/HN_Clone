class LinksController < ApplicationController

  def new
    if signed_in?
      @link = Link.new
    else
      flash[:error] = "You must sign in to post links"
      session[:intended_destination] = '/links/new'
      redirect_to new_session_path
    end
  end

  def index
    @links = Link.order('votes_count DESC').page(params[:page])
  end

  def show
    @link = Link.find(params[:id])
    @commentable = @link
    @comments = @commentable.comments
    @comment = Comment.new
    session[:source_link] = request.fullpath
  end

  def create
    @link = Link.new(params[:link])
    @link.user_id = current_user.id

    if @link.save
      flash[:message] = "You rock!  You made a link."
      redirect_to link_path(@link.id)
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

    @link.user_id = current_user.id
    if @link.update_attributes(params[:link])
      flash[:message] = "Link updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

end
