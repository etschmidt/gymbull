class Power < ApplicationRecord

	def initialize
		@month = Date.today.strftime("%B")
		@day = Date.today.strftime("%A")
		@date = Date.today.strftime("%d")
		@tags = tags
	end

	def title
		if @day == "Monday"
			return "Recovery"
		elsif @day == "Tuesday"
   		return "Squat Day"
		elsif @day == "Wednesday"
			return "Press Day"
		elsif @day == "Thursday"
			return "Recovery"
		elsif @day == "Friday"
			return "Deadlift Day"
		elsif @day == "Saturday"
			return "Bench Day"
		else #Sunday
			return "Rest"
		end 
	end
	
	def tags
		if @day == "Monday"
			return "Recovery"
		elsif @day == "Tuesday"
   		return "Squatz"
		elsif @day == "Wednesday"
			return "Press"
		elsif @day == "Thursday"
			return "Recovery"
		elsif @day == "Friday"
			return "Deadlift"
		elsif @day == "Saturday"
			return "Bench"
		else #Sunday
			return "Rest"
		end 
	end

	def muscles
		if @day == "Monday" or @day == "Thursday"
			return ""
		elsif @day == "Tuesday" or @day == "Friday"
			return "Legs, Back"
		elsif @day == "Wednesday" or @day == "Saturday"
			return "Chest, shoulders"
		elsif @day == "Sunday"
			return ""
		end 
	end

	def reps
		if @month == "June" or @month == "September" or @month == "December" or @month =="March"
			@reps1 = "5"
			@reps2 = "8"
		elsif @month == "July" or @month == "October"	or @month == "January" or @month =="April"
			@reps1 = "3"
			@reps2 = "6"
		elsif @month == "August" or @month == "November" or @month == "February" or @month =="May"
			if @date.to_i <= 15
				@reps1 = "2"
				@reps2 = "6"
			else
				@reps1 = "1"
				@reps2 = "6"
			end
		end
	end

	def print_power
		if @date.to_i >= 16 && (@month == "August" or @month == "November" or @month == "February" or @month =="May")
			return "Light cardio and active recovery. Focus on stretching/ rehab for knees, hips and shoulders.\n" +
							"Don't forget to reduce caloric intake when not lifting"
		else
			if @day == "Monday"
				return "Light cardio and active recovery"

			elsif @day == "Tuesday"
	   		return "Squat - 3 sets of #{@reps1}\n" +
	   						"Pause - Squat 3 sets of #{@reps1}\n" +
								"RDL - 2 sets of #{@reps2}\n" + 
								"Abs - 2 sets of 8 per lift attempted"

			elsif @day == "Wednesday"
				return "Hang Cleans - 3 sets of #{@reps1}\n" +
								"Floor Press - 2 sets of #{@reps2}\n" +
								"Chins, weighted - 3 sets of #{@reps2}\n" +
								"Standing Press - 3 sets of #{@reps2}\n" +
								"Face pulls - 2 sets of 12"

			elsif @day == "Thursday"
				return "Light cardio and active recovery"

			elsif @day == "Friday"
				return "Deadlift - 3 sets of #{@reps1}\n" +
								"Lat Pulls - 3 sets of #{@reps2}\n" +
								"Good Mornings - 3 sets of #{@reps1}\n" +
								"Overhead Squat - 2 sets of #{@reps2}\n" +
								"Abs - 2 sets of 8 per lift attempted"

			elsif @day == "Saturday"
				return "Bench - 3 sets of #{@reps1}\n" +
								"Chains/Boards - 3 sets of #{@reps1}\n" +
								"Triceps - 2 sets of #{@reps2}\n" +
								"Pecs (weighted dips) - 3 sets of #{@reps2}\n" +
								"One arm rows - 3 sets of #{@reps2}\n" +
								"Rear Delts - 2 sets of #{@reps2}"

			else #Sunday
				return "Take a day off - you've earned it!"
			end

		end
	end

end