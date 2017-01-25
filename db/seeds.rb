# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "TheBull",
             email: "TheBull@gymbull.com",
             password:              "Eagles69!!",
             password_confirmation: "Eagles69!!",
             account_type = "user"
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "EthanTSchmidt",
             email: "ethan.t.schmidt@gmail.com",
             password:              "Eagles69!!",
             password_confirmation: "Eagles69!!",
             account_type = "user"
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
             
User.create!(name:  "Dandylion",
             email: "danielle.dagostino@gmail.com",
             password:              "Cheese4785",
             password_confirmation: "Cheese4785",
             account_type = "user"
             location:  "San Diego",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

# Gyms
15.times do |n|
  last_name = Faker::Name.last_name
  name = "#{last_name}Gym"
  email = "examplegym-#{n+1}@gymbull.com"
  password = "Password1"
  account_type = "gym"
  focus = Faker::Name.focus
  location = Faker::Address.city
  about =  Faker::Lorem.paragraph(2)
  hours = Faker::Lorem.sentence(8)
  pricing = Faker::Lorem.sentence(8)
  equipment = Faker::Lorem.sentence(8)
  classes = Faker::Lorem.sentence(8)
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               account_type: account_type,
               location:  location,
               about:  about,
               focus: focus, 
               hours: hours,
               pricing: pricing, 
               equipment: equipment, 
               classes: classes,
               activated: true,
               activated_at: Time.zone.now)
end

# Users
50.times do |n|
  name  = Faker::Name.first_name
  email = "example-#{n+1}@gymbull.com"
  password = "Password1"
  account_type = "user"
  location = Faker::Address.city
  height = Faker::Number.between(48, 90)
  weight = Faker::Number.between(100, 400)
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               account_type: account_type,
               location:  location,
               height:  height,
               weight:  weight,
               activated: true,
               activated_at: Time.zone.now)
end

# Workouts 1
users = User.order(:created_at).take(6)
5.times do\
  post_type = "workout"
  title = Faker::Ancient.hero
  body_parts = Faker::Name.body
  duration = Faker::Number.between(5, 240)
  equipment = Faker::Name.equipment
  content = "Light cardio warmup;
            5x5 #{equipment}
            Bicep curls until failure;
            streching and cool-down"
  tag_list = Faker::Name.fitnesstags
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         body_parts: body_parts, duration: duration,
                                         equipment: equipment, content: content, 
                                         tag_list: tag_list) }
end

# Workouts 2
users = User.order(:created_at).offset(20).take(6)
5.times do\
  post_type = "workout"
  title = Faker::Ancient.hero
  body_parts = Faker::Name.body
  duration = Faker::Number.between(5, 240)
  equipment = Faker::Name.equipment
  content = "Light cardio warmup;
            5x5 #{equipment}
            Bicep curls until failure;
            streching and cool-down"
  tag_list = Faker::Name.fitnesstags
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         body_parts: body_parts, duration: duration,
                                         equipment: equipment, content: content, 
                                         tag_list: tag_list) }
end

# Workouts 3
users = User.order(:created_at).offset(30).take(6)
5.times do\
  post_type = "workout"
  title = Faker::Ancient.hero
  body_parts = Faker::Name.body
  duration = Faker::Number.between(5, 240)
  equipment = Faker::Name.equipment
  content = "Light cardio warmup;
            5x5 #{equipment}
            Bicep curls until failure;
            streching and cool-down"
  tag_list = Faker::Name.fitnesstags
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         body_parts: body_parts, duration: duration,
                                         equipment: equipment, content: content, 
                                         tag_list: tag_list) }
end

# Meals 1
users = User.order(:created_at).take(6)
5.times do\
  post_type = "meal"
  title = Faker::Beer.hop
  calories = Faker::Number.between(5, 240)
  protein = Faker::Number.between(5, 240)
  carbs = Faker::Number.between(5, 240)
  fat = Faker::Number.between(5, 240)
  ingredients = Faker::Food.ingredient
  measurement = Faker::Food.measurement
  content = "Preheat oven to 350;
              Stir #{ingredients} x #{measurement} into large bowl,
              serve over rice"
  tag_list = Faker::Name.mealtags
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         calories: calories, protein: protein,
                                         fat: fat, carbs: carbs, ingredients: ingredients,
                                         content: content, tag_list: tag_list) }
end

# Meals 2
users = User.order(:created_at).offset(10).take(6)
5.times do\
  post_type = "meal"
  title = Faker::Beer.hop
  calories = Faker::Number.between(5, 240)
  protein = Faker::Number.between(5, 240)
  carbs = Faker::Number.between(5, 240)
  fat = Faker::Number.between(5, 240)
  ingredients = Faker::Food.ingredient
  measurement = Faker::Food.measurement
  content = "Preheat oven to 350;
              Stir #{ingredients} x #{measurement} into large bowl,
              serve over rice"
  tag_list = Faker::Name.mealtags
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         calories: calories, protein: protein,
                                         fat: fat, carbs: carbs, ingredients: ingredients,
                                         content: content, tag_list: tag_list) }
end

# Meals 3
users = User.order(:created_at).offset(26).take(6)
5.times do\
  post_type = "meal"
  title = Faker::Beer.hop
  calories = Faker::Number.between(5, 240)
  protein = Faker::Number.between(5, 240)
  carbs = Faker::Number.between(5, 240)
  fat = Faker::Number.between(5, 240)
  ingredients = Faker::Food.ingredient
  measurement = Faker::Food.measurement
  content = "Preheat oven to 350;
              Stir #{ingredients} x #{measurement} into large bowl,
              serve over rice"
  tag_list = Faker::Name.mealtags
  users.each { |user| user.posts.create!(post_type: post_type, title: title, 
                                         calories: calories, protein: protein,
                                         fat: fat, carbs: carbs, ingredients: ingredients,
                                         content: content, tag_list: tag_list) }
end

# Posts 1
users = User.order(:created_at).take(6)
5.times do\
  post_type = "post"
  content = Faker::TwinPeaks.quote
  tag_list = Faker::Name.posttags
  users.each { |user| user.posts.create!(post_type: post_type, content: content,
                                          tag_list: tag_list) }
end

# Posts 2
users = User.order(:created_at).offset(15).take(6)
5.times do\
  post_type = "post"
  content = Faker::TwinPeaks.quote
  tag_list = Faker::Name.posttags
  users.each { |user| user.posts.create!(post_type: post_type, content: content,
                                          tag_list: tag_list) }
end

# Posts 3
users = User.order(:created_at).offset(35).take(6)
5.times do\
  post_type = "post"
  content = Faker::TwinPeaks.quote
  tag_list = Faker::Name.posttags
  users.each { |user| user.posts.create!(post_type: post_type, content: content,
                                          tag_list: tag_list) }
end


# Following relationships
users = User.all
user  = users.first
following = users[2..15]
followers = users[3..75]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }