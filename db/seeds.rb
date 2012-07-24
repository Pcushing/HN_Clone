# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["patrick@example.com", "david@example.com"].each do |user|
  User.create(:email => user, :password => "bootcamp", :password_confirmation => "bootcamp")
end

(1..20).each do |num|
  User.first.links.create(:url => "http://news.ycombinator.com/" + num.to_s, :title => "Hacker News " + num.to_s)
end

(21..40).each do |num|
  User.last.links.create(:url => "http://news.ycombinator.com/" + num.to_s, :title => "Hacker News " + num.to_s)
end