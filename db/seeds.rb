# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rubygems'
require 'faker'
# 20.times do
#   User.create(email: Faker::Internet.email)
# end

# 10.times do
#   # ShortenedURL.create(long_url: Faker::Internet.url, user_id: (rand * 20).round)
#   r = User.all.length * rand
#   ShortenedURL.create_for_user_and_long_url!(User.all[r].email, Faker::Internet.url)
# end

10.times do
  # ShortenedURL.create(long_url: Faker::Internet.url, user_id: (rand * 20).round)
  r = (User.all.length * rand)
  u = (ShortenedURL.all.length * rand)
  Visit.record_visit!(User.all[r].email, ShortenedURL.all[u].short_url)
end
