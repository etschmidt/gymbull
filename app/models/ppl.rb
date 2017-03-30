class Ppl < ApplicationRecord
	
	def initialize 
		@day = Date.today.strftime("%A")
		@title = title
		@abs1 = ABS.first
		@abs2 = ABS.last
	end
	
	CHEST = ["SATOR", "AREPO"].shuffle
	SHOLDERS = ["TENET", "OPERA"].shuffle
	TRICEPS = ["ROTAS"].shuffle
	
	BACK = ["SATOR", "AREPO"].shuffle
	TRAPS = ["TENET", "OPERA"].shuffle
	BICEPS = ["ROTAS"].shuffle
	
	QUADS = ["SATOR", "AREPO"].shuffle
	HAMSTRINGS = ["TENET", "OPERA"].shuffle
	CALVES = ["ROTAS"].shuffle
	
	ABS = ["SATOR", "AREPO"].shuffle
	
	
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
	
	def isolates
		if @title == "Push"
			@muscles = "Chest, Shoulders & Triceps"
			@iso1a = CHEST.first
			@iso1b = CHEST.last
			@iso2a = SHOULDERS.first
			@iso2b = SHOULDERS.last
			@iso3a = TRICEPS.first
			@iso3b = TRICEPS.last
		elsif @title == "Push"
			@muscles = "Back, Traps & Biceps"
			@iso1a = BACK.first
			@iso1b = BACK.last
			@iso2a = TRAPS.first
			@iso2b = TRAPS.last
			@iso3a = BICEPS.first
			@iso3b = BICEPS.last
		else @title == "Push"
			@muscles = "Quads, Hamstrings & Calves"
			@iso1a = QUADS.first
			@iso1b = QUADS.last
			@iso2a = HAMSTRINGS.first
			@iso2b = HAMSTRINGS.last
			@iso3a = CALVES.first
			@iso3b = CALVES.last
		end
	end
	
	def compounds
		if @day == "Monday"
			@compound1 = "Flat Barbell Bench Press"
			@compound2 = "Seated Dumbbell Overhead Press"
		elsif @day == "Tuesday"
			@compound1 = "Deadlift"
			@compound2 = "Weighted Chin-ups"
		elsif @day == "Wednesday"
			@compound1 = "Back Squat"
			@compound2 = ""
		elsif @day == "Thursday"
			@compound1 = "Standing Military Press"
			@compound2 = "Incline Dumbbel Bench Press"
		elsif @day == "Friday"
			@compound1 = "Snatch Grip Deadlift"
			@compound2 = "Weighted Pull-ups"
		elsif @day == "Saturday"
			@compound1 = "Front Squat"
			@compound2 = "Seated Dumbbell Overhead Press"
		else #Sunday
			@compound1 = ""
			@compound2 = ""
		end 
	end
		
	def print_ppl
		print "#{@day} - #{@title}\n\n" +
		"5 x 5:\n" +
		"#{@compound1}\n" +
		"#{@compound2}\n\n" +
		"4 x 8-12:\n" +
		"#{@iso1a}\n" +
		"#{@iso1b}\n\n" +
		"#{@iso2a}\n" +
		"#{@iso2b}\n\n" +
		"#{@iso3a}\n" +
		"#{@iso3b}\n\n" +
		"5 x 20:\n" +
		"#{@abs1}\n" +
		"#{@abs2}\n"
		
	end
	
	
end
