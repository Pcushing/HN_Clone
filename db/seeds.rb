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

(1..20).each do |num|
  user1.links.create(:url => "http://news.ycombinator.com/" + num.to_s, :title => "Hacker News " + num.to_s)
  Link.last.votes.create(:user_id => 4, :up => true)
end

(21..40).each do |num|
  user2.links.create(:url => "http://news.ycombinator.com/" + num.to_s, :title => "Hacker News " + num.to_s)
  Link.last.votes.create(:user_id => 1, :up => true)
  Link.last.votes.create(:user_id => 3, :up => true)
end

Vote.create(:user_id => 4, :up => true, :link_id => 22)

