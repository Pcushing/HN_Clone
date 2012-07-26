class VotesController < ApplicationController

  def new
  end

  def create
    session[:vote_source] = request.referer

    @vote = Vote.new(:up => params[:up],
                     :down => params[:down],
                     :votable_id => params[:votable_id],
                     :votable_type => params[:votable_type])

    #This needs to be fixed.  Signed_in and save verifications are different
    if signed_in?
      @vote.user_id = current_user.id
      @vote.save
      flash[:message] = "We can save! But we need to be able to just re-render the same page."
      redirect_to session[:vote_source]
      session[:vote_source] = nil
    else
      flash[:error] = "You must sign in to vote."
      # session[:intended_destination] = "this is the cookie i'm looking for"
      redirect_to new_session_path
    end
  end
end
