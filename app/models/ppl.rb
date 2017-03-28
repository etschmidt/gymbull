class Ppl < ApplicationRecord
	
	def initialize 
		@day = Date.today.strftime("%A")
		@title = title
		@compound1 = compound1
		@compound2 = compound2
		@iso1a
		@iso1b
		@iso2a
		@iso2b
		@iso3a
		@iso3b
		@abs1
		@abs2
	end
	
	def title
		if @day == "Monday" or @day == "Thursday"
			return "Push"
		elsif @day == "Tuesday" or @day == "Friday"
			return "Pull"
		elsif @day == "Wednesday" or @day == "Saturday"
			return "Legs"
		else
			return "Rest"
		end 
	end
	
	def compound1
		if @day == "Monday"
			return "Flat Barbell Bench Press"
		elsif @day == "Tuesday"
			return "Deadlift"
		elsif @day == "Wednesday"
			return "Back Squat"
		elsif @day == "Thursday"
			return "Standing Military Press"
		elsif @day == "Friday"
			return "Snatch Grip Deadlift"
		elsif @day == "Saturday"
			return "Front Squat"
		else
			return ""
		end 
	end

	def compound2
		if @day == "Monday"
			return "Seated Dumbbell Overhead Press"
		elsif @day == "Tuesday"
			return "Weighted Chin-ups"
		elsif @day == "Wednesday"
			return ""
		elsif @day == "Thursday"
			return "Standing Military Press"
		elsif @day == "Friday"
			return "Weighted Pull-ups"
		elsif @day == "Saturday"
			return ""
		else
			return ""
		end 
	end
			
	
end
