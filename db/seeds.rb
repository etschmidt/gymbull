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
             
Gym.create!(name:  "Bull Gym",
               gym_admin: 1,
               email: "bull@gym.com",
               location:  "San Diego",
               about:  "Good",
               focus:  "Crossfit",
               hours:  "Open",
               pricing:  "Free",
               equipment:  "None",
               classes:  "None")
# Users
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gymbull.com"
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

# Gyms
10.times do |n|
  name  = Faker::Team.name
  email = "gym-example-#{n+1}@gymbull.com"
  location = Faker::Address.city
  about =  Faker::Lorem.paragraph(2)
  focus = "General Purpose"
  hours = Faker::Lorem.sentence(8)
  pricing = Faker::Lorem.sentence(8)
  equipment = Faker::Lorem.sentence(10)
  classes = Faker::Lorem.sentence(6)
  Gym.create!(name:  name,
               gym_admin: 10,
               email: email,
               location:  location,
               about:  about,
               focus:  focus,
               hours:  hours,
               pricing:  pricing,
               equipment:  equipment,
               classes:  classes)
end

# Workouts
users = User.order(:created_at).take(6)
5.times do\
  post_type = "workout"
  title = Faker::Superhero.name
  body_parts = Faker::Lorem.sentence(2)
  duration = Faker::Number.between(5, 240)
  equipment = Faker::Lorem.sentence(4)
  content = Faker::Lorem.paragraph(3)
  tag_list = Faker::Hipster.words(2, false, false)
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         body_parts: body_parts, duration: duration,
                                         equipment: equipment, content: content, 
                                         tag_list: tag_list) }
end

# Meals
users = User.order(:created_at).take(6)
5.times do\
  post_type = "meal"
  title = Faker::Pokemon.name
  calories = Faker::Number.between(5, 240)
  protein = Faker::Number.between(5, 240)
  carbs = Faker::Number.between(5, 240)
  fat = Faker::Number.between(5, 240)
  ingredients = Faker::Lorem.sentence(4)
  content = Faker::Lorem.paragraph(3)
  tag_list = Faker::Hipster.words(2, false, false)
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         calories: calories, protein: protein,
                                         fat: fat, carbs: carbs, ingredients: ingredients,
                                         content: content, tag_list: tag_list) }
end

# Posts
users = User.order(:created_at).take(6)
5.times do\
  post_type = "post"
  content = Faker::Lorem.sentence(5)
  tag_list = Faker::Hipster.words(2, false, false)
  users.each { |user| user.posts.create!(post_type: post_type, content: content,
                                          tag_list: tag_list) }
end

gyms = Gym.order(:created_at).take(6)
5.times do\
  post_type = "post"
  content = Faker::Lorem.sentence(5)
  tag_list = Faker::Hipster.words(2, false, false)
  gyms.each { |gym| gym.posts.create!(post_type: post_type, content: content,
                                          tag_list: tag_list) }
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }