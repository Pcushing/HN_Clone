module LinksHelper
  def less_than_fifteen_minutes_from_creation?(link)
    (Time.now - link.created_at) < 900
  end
end



