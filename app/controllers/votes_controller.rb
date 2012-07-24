class VotesController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    @vote = Vote.new(:up => params[:up],
                     :down => params[:down],
                     :user_id => params[:user_id],
                     :link_id => params[:link_id])
    if @vote.save
      flash[:message] = "We can save! But we need to be able to just re-render the same page."
      redirect_to root_path
    else
      flash[:error] = "You can't vote on your own links, or vote more than once. Sorry, g."
      redirect_to root_path
    end
  end

end
