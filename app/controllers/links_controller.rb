class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def index
    @links = Link.order("created_at").page(params[:page])
  end

  # def show
  #   @link = Link.find(params[:id]
  # end

  def create
    @link = Link.new(params[:link])

    if @link.save
      flash[:message] = "You rock!  You made a link."
      redirect_to root_path
    else
      flash[:error] = "You messed up.  Try again."
      render new_link_path
    end

  end

end
