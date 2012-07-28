require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["patrick@example.com", "david@example.com", "pc@example.com", "dl@example.com"].each do |user|
  User.create(:email => user, :password => "bootcamp", :password_confirmation => "bootcamp")
end

user1 = User.find(1)
user2 = User.find(2)

# Scrape HN for actual data
def get_titles_and_urls(url)
  titles_and_urls = []
  content = Nokogiri::HTML(open(url))
  content.css('td.title a').each do |entry|
    pair = {}
    pair["url"] = entry.to_s[9..(entry.to_s.index('">')-2)]
    pair["title"] =  entry.to_s[(entry.to_s.index(">")+1)..(entry.to_s.index("<")-5)]
    titles_and_urls << pair
  end
  titles_and_urls.pop
  titles_and_urls
end

# Seed links from user1 from the HN homepage, then vote on each by user 4
get_titles_and_urls('http://news.ycombinator.com/').each do |link|
  user1.links.create(link)
  Link.last.votes.create(:user_id => 4, :up => true)
end

# Seed links from user1 from the HN homepage, then vote on each by user 1, 3
get_titles_and_urls('http://news.ycombinator.com/news2').each do |link|
  user2.links.create(link)
  Link.last.votes.create(:user_id => 1, :up => true)
  Link.last.votes.create(:user_id => 3, :up => true)
end

# Add one more vote so there's only 1 link with the top number of votes
Link.last.votes.create(:user_id => 4, :up => true)

# Add comments
all_links = Link.all
all_links.each { |link| link.comments.create(:body => "Look at this fancy lil first level comment", :user_id => 3) }

# Add comments on comments
all_comments = Comment.all
all_comments[0..10].each { |comment| comment.comments.create(:body => "Look at this fancy lil second level comment", :user_id => 4) }

# Add one more level of comment (comments on comments on comments)
Comment.last.comments.create(:body => "Look at this fancy lil third level comment", :user_id => 1)



