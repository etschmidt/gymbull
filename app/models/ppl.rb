class Ppl < ApplicationRecord
	
	def initialize 
		@day = Date.today.strftime("%A")
		@title = title
		@abs1 = ABS.first
		@abs2 = ABS.last
	end
	
	CHEST = ["Dumbbell Floor Press", "Cable Crossovers (mid chest)", "Cable Crossovers (bent over)", "Wide Reverse Grip Bench Press", "Decline Bench Press",
	"Decline Dumbbell Bench Press", "Incline Bench Press", "Dumbbell Flys", "Pec Dec", "Machine Flys", 
	"Chest Dip", "Incline Dumbbell Flys", "Dumbbell Pullover", "Lying Cable Pullover", "Barbell Pullover", 
	"Alternate Dumbbell Bench Press (high start)", "Decline Dumbbell Flys", "Reverse Dumbbell Bench Press", "Reverse Grip Bench Press", "Muscle Clean & Press"].shuffle
	
	SHOULDERS = ["Seated Arnold Press", "Weight Plate Front Raise", "Rear Delt Barbell Row To Neck", "Seated Dumbbell Lateral Raise", "Standing Arnold Press",
	"Alternate Bent Over Dumbbell Reverse Fly", "Dumbbell Lateral Raise", "Dumbbell Front Raise", "Seated Bent Over Dumbbell Reverse Fly", "Cable Lateral Raise", 
	"Lying Rear Delt Barbell Raise", "Dublin Press", "Cuban Press", "Cable Front Raise", "Seated Barbell Front Raise", 
	"Dumbbell Reverse Fly On Incline Bench", "Machine Reverse Flys", "Military Press Behind Neck", "Alternate Seated Dumbbell Press", "One Arm Standing Dumbbell Front Raise"].shuffle
	
	TRICEPS = ["Dumbbell Tricep Kickback", "One Arm Standing Dumbbell Extension", "Close Grip Push Up", "Weighted Tricep Dips", "Alternate Lying Dumbbell Extension",
	"EZ Bar Incline Skullcrusher", "Incline Two Arm Dumbbell Extension", "One Arm Seated Overhead Tricep Extension", "Lying Tricep Extension ", "Close Grip Bench Press", 
	"High Pulley Overhead Rope Extension", "EZ Bar Skullcrusher", "French Press", "One Arm Seated Dumbbell Extension", "Lying Dumbbell Extension", 
	"Seated French Press", "Two Arm Cable Tricep Kickback", "Weighted Bench Dips", "Close Grip Dumbbell Press", "Decline Lying Dumbbell Extension"].shuffle
	
	BACK = ["Close Grip Pull Up", "Straight Arm Lat Pull Down", "Behind Neck Lat Pull Down", "V-Bar Pull Up", "Close Grip Lat Pull Down",
	"Rope Lat Pull Down", "Underhand Close Grip Lat Pull Down", "Close Grip Lat Pull Down", "Rope Pull Up", "Lat Pull Down", 
	"Incline Bench Two Arm Dumbbell Row", "Cable Seated Row", "One Arm Dumbbell Row", "Bent Over Dumbbell Row", "T-Bar Row", 
	"EZ Bar Reverse Grip Bent Over Row", "Standing One Arm Cable Row", "Reverse Grip Bent Over Row", "Incline Bench Barbell Row", "One Arm T-Bar Row"].shuffle
	
	TRAPS = ["Dumbbell Upright Row", "Cable Upright Row", "Behind The Back Barbell Shrug", "One Arm Dumbbell Upright Row", "Barbell Shrug",
	"Dumbbell Shrug", "Barbell Upright Row", "Barbell Wide Grip Row", "Sumo Deadlift High Pull", "Cable Shrug", 
	"Seated Cable Shrug", "Seated Dumbbell Shrug", "Seated Cable Face Pull", "Tate Press", "Cable Face Pull"].shuffle
	
	BICEPS = ["Cross Body Hammer Curl", "EZ Bar Curl", "Alternating Standing Dumbbell Curl", "Dumbbell Preacher Curl", "Cable Curl",
	"Zottman Curl", "Close Grip EZ Bar Curl", "Rope Cable Curl", "Wide Grip EZ Bar Curl", "Alternate Seated Hammer Curl", 
	"Concentration Curl", "Incline Dumbbell Curl", "EZ Bar Preacher Curl", "Standing Dumbbell Curl", "Standing Hammer Curl", 
	"Standing Barbell Curl", "Barbell Preacher Curl", "Alternate Seated Dumbbell Curl", "Alternate Standing Hammer Curl", "Hammer Bar Preacher Curl"].shuffle
	
	QUADS = ["Leg Extension", "One Leg Dumbbell Squat", "Dumbbell Walking Lunge", "Barbell Walking Lunge", "Goblet Squat",
	"Dumbbell Jumping Squat", "Wide Squat", "Dumbbell Rear Lunge", "Leg Press", "Dumbbell Step Up", 
	"Zerchers squat", "Narrow Squat", "Weighted Pistol Squat", "Single Leg Extension", "Single Leg Press", 
	"Dumbbell Lunge", "Barbell Lunge"].shuffle
	
	HAMSTRINGS = ["Leg Curl", "Dumbbell Stiff Leg Deadlift", "Good Mornings", "Romanian Deadlift", "Dumbbell Hamstring Curl",
	"Lying Cable Hamstring Curl", "Single Leg Curl", "One Leg Lying Cable Hamstring Curl", "Wide Grip Deadlift", " Wide Grip Romanian Deadlift"].shuffle
	
	CALVES = ["Standing Barbell Calf Raise", "Seated Barbell Calf Raise", "Standing Dumbbell Calf Raise", "One Leg Seated Dumbbell Calf Raise", "Rocking Standing Calf Raise",
	"Donkey Calf Raise", "One Leg Donkey Calf Raise", "45 Degree Toe Raise"].shuffle
	
	ABS = ["Scullers", "Abdominal Air Bike", "Lying Alternate Floor Leg Raise", "Standing Barbell Twist", "Wood Chop",
	"Standing Cable Crunch", "Kneeling Cable Crunch", "Dumbbell Side Bends", "Weighted Crunch", "Decline Sit Up", 
	"Lying Bench Leg Raise", "Hanging Knee Raise", "Strict Toes to Bar", "Russian Twist", "Seated Barbell Twist", 
	"Twisting Decline Sit Up", "Lying Heel Touches", "Twisting Hanging Knee Raise", "Saw in Plank", "Ab Rollout"].shuffle

	def title
		if @day == "Monday"
			return "Monday - Push"
		elsif @day == "Tuesday"
   		return "Tuesday - Pull"
		elsif @day == "Wednesday"
			return "Wednesday - Legs"
		elsif @day == "Thursday"
			return "Thursday - Push"
		elsif @day == "Friday"
			return "Friday - Pull"
		elsif @day == "Saturday"
			return "Saturday - Legs"
		else #Sunday
			return "Sunday"
		end 
	end
	
	def muscles
		if @day == "Monday" or @day == "Thursday"
			return "Chest, Shoulders & Triceps"
		elsif @day == "Tuesday" or @day == "Friday"
			return "Back, Traps & Biceps"
		elsif @day == "Wednesday" or @day == "Saturday"
			return "Quads, Hamstrings & Calves"
		elsif @day == "Sunday"
			return "None"
		end 
	end
	
	def isolates
		if @day == "Monday" or @day == "Thursday"
			@iso1a = CHEST.first
			@iso1b = CHEST.last
			@iso2a = SHOULDERS.first
			@iso2b = SHOULDERS.last
			@iso3a = TRICEPS.first
			@iso3b = TRICEPS.last
		elsif @day == "Tuesday" or @day == "Friday"
			@iso1a = BACK.first
			@iso1b = BACK.last
			@iso2a = TRAPS.first
			@iso2b = TRAPS.last
			@iso3a = BICEPS.first
			@iso3b = BICEPS.last
		else @day == "Wednesday" or @day == "Saturday"
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
			@title = "Monday - Push"
			@compound1 = "Flat Barbell Bench Press"
			@compound2 = "Seated Dumbbell Overhead Press"
		elsif @day == "Tuesday"
   		@title = "Tuesday - Pull"
			@compound1 = "Deadlift"
			@compound2 = "Weighted Chin-ups"
		elsif @day == "Wednesday"
			@title = "Wednesday - Legs"
			@compound1 = "Back Squat"
			@compound2 = ""
		elsif @day == "Thursday"
			@title = "Thursday - Push"
			@compound1 = "Standing Military Press"
			@compound2 = "Incline Dumbbel Bench Press"
		elsif @day == "Friday"
			@title = "Friday - Pull"
			@compound1 = "Snatch Grip Deadlift"
			@compound2 = "Weighted Pull-ups"
		elsif @day == "Saturday"
			@title = "Saturday - Legs"
			@compound1 = "Front Squat"
			@compound2 = "Seated Dumbbell Overhead Press"
		else #Sunday
			@title = "Sunday"
			@compound1 = ""
			@compound2 = ""
		end 
	end
		
	def print_ppl
		if @day == "Sunday"
			"Rest Day"
		else
			"5 x 5:\n" +
			"#{@compound1}\n" +
			"#{@compound2}\n\n" +
			"4 x 8-12:\n" +
			"#{@iso1a}\n" +
			"#{@iso2a}\n" +
			"#{@iso3a}\n\n" +
			"#{@iso1b}\n" +
			"#{@iso2b}\n" +
			"#{@iso3b}\n\n" +
			"5 x 20:\n" +
			"#{@abs1}\n" +
			"#{@abs2}\n"
		end
	end
	
	
end
