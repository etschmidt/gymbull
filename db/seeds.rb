# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Ethan T Schmidt",
             email: "ethan.t.schmidt@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             location:  "San Diego",
             about:  "I'm me",
             height:  69,
             weight:  190,
             goals:  "Win",
             prs:  "Won",
             quals:  "Winner",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
users = User.order(:created_at).take(6)
50.times do\
  post_type = "post"
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(post_type: post_type, content: content) }
end

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gymgoat.com"
  password = "password"
  location = Faker::Address.city
  about =  Faker::Lorem.paragraph(2)
  height = Faker::Number.between(48, 90)
  weight = Faker::Number.between(100, 400)
  goals = Faker::Lorem.sentence(8)
  prs = Faker::Lorem.sentence(10)
  quals = Faker::Lorem.sentence(6)
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               location:  location,
               about:  about,
               height:  height,
               weight:  weight,
               goals:  goals,
               prs:  prs,
               quals:  quals,
               activated: true,
               activated_at: Time.zone.now)
end