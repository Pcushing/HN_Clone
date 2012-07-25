class VotesController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    @vote = Vote.new(:up => params[:up],
                     :down => params[:down],
                     :link_id => params[:link_id])

    #This needs to be fixed.  Signed_in and save verifications are different
    if signed_in?
      @vote.user_id = current_user.id
      @vote.save
      flash[:message] = "We can save! But we need to be able to just re-render the same page."
      redirect_to root_path
    else
      flash[:error] = "You must sign in to vote."
      redirect_to new_session_path
    end
  end

end
