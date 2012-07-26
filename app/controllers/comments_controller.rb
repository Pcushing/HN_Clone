class CommentsController < ApplicationController
  before_filter :load_commentable

  def show
    @comment = Comment.find(params[:id])
    @commentable = @comment
    @comments = @commentable.comments
    @new_comment = Comment.new
  end

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    # I don't like the nested If statements, but we can clean up later.
    # Not sure the best way to do this sign-in check here
    if signed_in?
      @comment = @commentable.comments.new(params[:comment])
      @comment.user_id = current_user.id

      if @comment.save
        flash[:message] = "Look at you just adding comments like a boss."
        redirect_to session[:source_link]
        session[:source_link] = nil
      else
        render [@commentable]
      end
    else
      #Need to set the session parameter to get the redirect_back_or experience
      redirect_to new_session_path
    end
  end

  private
    def load_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

end
