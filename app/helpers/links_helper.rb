module LinksHelper
  def less_than_fifteen_minutes_from_creation?(link)
    (Time.now - link.created_at) < 900
  end

  def get_responses_count(commentable)
    commentable.comments.count + commentable.comments.each do |response|
        get_responses_count(response).sum unless response.comments.empty?
      end
  end
end



