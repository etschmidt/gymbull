task :follow => :environment do
	bot_id = [10, 12, 6, 35, 41, 61, 49, 63, 68, 
						56, 58, 46, 67, 4, 82, 80, 38, 86, 
						83, 33, 85, 98, 101, 103, 108, 118, 124, 128, 131].sample
	
	user1 = User.find_by(id: bot_id)

	user2 = User.where.not(id: user1.following).sample
	
	relationship = Relationship.new(follower_id: user1.id, followed_id: user2.id)	
	relationship.save
end