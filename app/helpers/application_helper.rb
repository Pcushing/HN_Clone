module ApplicationHelper
  def get_comments_score(comment)
    comment.votes.where(up: true).count - comment.votes.where(down: true).count
  end
end
