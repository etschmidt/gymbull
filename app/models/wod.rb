class Wod < ApplicationRecord

  def initialize
    @wod_type = WOD_TYPES.sample
    @time = time
    @rounds = rounds
    @pull = PULLS.first
    @run = RUNS.first
    @sit = SITS.first
    @jump = JUMPS.first
    @light = LIGHTS.first
    @heavy = HEAVYS.first
    @pull2 = PULLS.last
    @run2 = RUNS.last
    @sit2 = SITS.last
    @jump2 = JUMPS.last
    @light2 = LIGHTS.last
    @heavy2 = HEAVYS.last
    @movements = movements
    @movement1 = @movements.at(0)
    @movement2 = @movements.at(1)
    @movement3 = @movements.at(2)
    @movement4 = @movements.at(3)
    @movement5 = @movements.at(4)
    @movement6 = @movements.at(5)
    @movement7 = @movements.at(6)
    @movement8 = @movements.at(7)
    @reps1 = reps(@movement1)
    @reps2 = reps(@movement2)
    @reps3 = reps(@movement3)
    @reps4 = reps(@movement4)
    @reps5 = reps(@movement5)
    @reps6 = reps(@movement6)
    @reps7 = reps(@movement7)
    @reps8 = reps(@movement8)
    @set1 = "#{@reps1} #{@movement1}"
    @set2 = "#{@reps2} #{@movement2}"
    @set3 = "#{@reps3} #{@movement3}"
    @set4 = "#{@reps4} #{@movement4}"
    @set5 = "#{@reps5} #{@movement5}"
    @set6 = "#{@reps6} #{@movement6}"
    @set7 = "#{@reps7} #{@movement7}"
    @set8 = "#{@reps8} #{@movement8}"
    @sets = sets
    
  # for the Strength & Skill
    @ss_type = SS_TYPES.sample
    @ss_heavy = HEAVYS.at(1)
    @ss_light = LIGHTS.at(1)
    @prog = PROGS.sample
    @me = MES.sample
    @death = DEATHS.sample
    @ss = ss
  end


WOD_TYPES = ["AMRAP", "RFT", "AMRAP", "RFT", "EMOM"]    #reduces the chances of EMOMs
PULLS = ["StrPullups", "StrHSPU", "BarMU", "RingMU", "RingDips", "RopeClimb",
         "KipPullups", "T2B", "C2B"].shuffle
RUNS = ["CalRow", "Row", "CalBike", "DU", "Run"].shuffle
SITS = ["Situps", "KBS", "KBSn", "KBC", "GHD", "HipExt", "Slamballs", "Pushups"].shuffle
JUMPS = ["BoxJumps", "BBJ", "BJO", "BBJO", "AirSquats", "Pistols", "Lunges",
         "Burpees", "Wallballs"].shuffle
LIGHTS = ["OHP", "C&Press", "SDLHP", "Snatches", "HangSnatch", "PowerSnatch", "HPS", "Thrusters", "Clusters", "OHS"].shuffle
HEAVYS = ["BackSquat", "FrontSquat", "Deadlift", "PushJerk", "PushPress", "Cleans", "HangClean", "PowerClean", "HPC", "C&J"].shuffle

  # for the Strength & Skill
SS_TYPES = ["ME", "Prog", "Death", "5x5Light", "5x5Heavy", "HSLight", "HSHeavy", "CardRun", "CardRow"]
PROGS = ["Bar Muscle Up", "Ring Muscle Up", "Pistol", "HSPU/HS Walk", "Pullup/C2B", "Rope Climb"]
MES = ["Pushups", "Situps", "Pistols", "Pullups", "Muscle Ups", "HSPU", "Wallballs", "DU", "GHD", 
       "T2B", "Air Squats", "Box Jumps", "Burpees", "KBS", "Ring Dips", "Row", "Assault Bike"]
DEATHS = ["Calorie Row", "Wallballs", "Deadlifts", "Front Squats", "Kettlebell Swings",
          "Muscle Ups", "Burpee Box Jumps", "Thrusters", "HSPU", "T2B", "Calorie Bike"]


# the time limits for AMRAP and EMOM
  def time
    unless @wod_type == "RFT"
      return rand(7..21)
    end
  end

  def rounds
    if @wod_type == "RFT"
      return rand(2..7)
    end
  end

# selects movements from categories
  def movements
    if @wod_type == "EMOM"
      return [@pull, @sit, @jump, @light, @heavy, 
            @pull2, @sit2, @jump2, @light2, @heavy2].shuffle
    else
      return [@pull, @run, @sit, @jump, @light, @heavy, 
            @pull2, @run2, @sit2, @jump2, @light2, @heavy2].shuffle
    end
  end

# number of reps for each movement
  def reps(movement)
    if @wod_type == "EMOM"
      if movement == "C&Press" or movement == "Clusters" or movement == "C&J"
        return rand(1..2)
      elsif movement == "RopeClimb"
        return 1
      else
        return rand(2..4)
      end
    else
      if movement == "DU"
        return rand(3..21) * 5
      elsif movement == "Run"
        return ["100", "200", "300", "400"].sample + "m"
      elsif movement == "Row"
        return ["250", "500", "750"].sample + "m"
      elsif movement == "BMU"
        return rand(2..9) 
      elsif movement == "RingMU"
        return rand(2..9)
      elsif movement == "RopeClimb"
        return rand(2..9)   
  # this is redundant to allow for futher refinement
      elsif @wod_type == "RFT"
        if @rounds < 5
          return [15, 20, 25, 30].sample
        else
          return rand(3..21) 
        end
      elsif @wod_type == "AMRAP"
        if @time < 12
          return rand(3..21)
        else 
          return [15, 20, 25, 30].sample
        end
      end
    end
  end

  def sets
    if @wod_type == "EMOM"
      return ["#{@set1}", "#{@set2}", "#{@set3}", "#{@set4}",
              "#{@set5}", "#{@set6}", "#{@set7}", "#{@set8}"]
              .sample(2).map { |i| "" + i.to_s + "" }.join("\n")
    elsif @wod_type == "RFT" 
      if @rounds < 5
        return ["#{@set1}", "#{@set2}", "#{@set3}", "#{@set4}",
                "#{@set5}", "#{@set6}", "#{@set7}", "#{@set8}"]
               .sample(rand(3..7)).map { |i| "" + i.to_s + "" }.join("\n")
      else
        return ["#{@set1}", "#{@set2}", "#{@set3}", "#{@set4}",
                "#{@set5}", "#{@set6}", "#{@set7}", "#{@set8}"]
               .sample(rand(2..4)).map { |i| "" + i.to_s + "" }.join("\n")
      end
    else     # wod_type is AMRAP
      if @time < 12
        return ["#{@set1}", "#{@set2}", "#{@set3}", "#{@set4}",
                "#{@set5}", "#{@set6}", "#{@set7}", "#{@set8}"]
               .sample(rand(3..7)).map { |i| "" + i.to_s + "" }.join("\n")
      else
        return ["#{@set1}", "#{@set2}", "#{@set3}", "#{@set4}",
                "#{@set5}", "#{@set6}", "#{@set7}", "#{@set8}"]
               .sample(rand(2..4)).map { |i| "" + i.to_s + "" }.join("\n")
      end
    end
  end

# if one of the movemnts is a light BB, then the heavy BB defaults to that weight as well
# clearly, there must be a better way to do this than check the regex against the string
  def bbweight
    if @sets.to_s =~ /OHP|C&Press|SDLHP|Snatches|HangSnatch|PowerSnatch|HPS|Thrusters|Clusters|OHS/ 
      return ["75/55", "95/65", "115/85", "135/95"].sample + "#\n"
    elsif @sets.to_s =~ /PushJerk|PushPress|HPC|C&J/
      return ["115/85", "135/95", "155/105", "185/115"].sample + "#\n"
    elsif @sets.to_s =~ /FrontSquat|Cleans|HangClean|PowerClean/
      return ["115/85", "135/95", "155/105", "185/115", "205/135", "225/155"].sample + "#\n"
    elsif @sets.to_s =~ /BackSquat|Deadlift/
      return ["115/85", "135/95", "155/105", "185/115", "205/135", "225/155", "275/185"].sample + "#\n"      
    end
  end

  def kbweight
    if @sets.to_s =~ /KB/
      return ["1", "1.5", "2"].sample + "pd kb\n"
    end
  end

  def slamweight
    if @sets.to_s =~ /Slamballs/
      return ["20/15", "30/20", "40/30"].sample + "# sb\n"
    end
  end

  def wallweight
    if @sets.to_s =~ /Wallballs/
      return ["20/14", "30/20"].sample + "# wb\n"
    end
  end

  def height
    if @sets.to_s =~ /BJ|BoxJumps/
       return ["24/20", "30/24"].sample + "\"\n"
    end
  end

  def ss
    if @ss_type == "ME"
      return ["3 x 1min", "2 x 2min", "3min"].sample + " max effort " + @me
    elsif @ss_type == "Prog"
      return "Work on " + @prog + " progressions for 15 minutes"
    elsif @ss_type == "Death"
      return "Death by " + @death
    elsif @ss_type == "5x5Light"
      return "5 5 5 5 5 " + @ss_light
    elsif @ss_type == "5x5Heavy"
      return "5 5 5 5 5 " + @ss_heavy
    elsif @ss_type == "HSLight"
      return @ss_heavy + " - work to heavy single for the day"
    elsif @ss_type == "HSHeavy"
      return @ss_heavy + " - work to heavy single for the day"
    elsif @ss_type == "CardRun"
      return ["6 x 200m", "4 x 400m", "2 x 800m", "1 mile", "2 mile"].sample + " run"
    elsif @ss_type == "CardRow"
      return ["6 x 250m", "4 x 500m", "1000m", "2000m", "3000m"].sample + " row"
    end
  end
  
  def print_ss
    "Strength / Skill:\n" +
    "#{@ss}\n\n"
  end

  def print_wod
    if @wod_type == "EMOM"
      "WOD:\n" +
      "#{@wod_type} #{@time}\n\n" +
      "#{@sets}\n\n" +
      "#{bbweight}" +
      "#{kbweight}" +
      "#{height}" +
      "#{slamweight}" +
      "#{wallweight}"
    else
      "WOD:\n" +
      "#{@rounds}#{@wod_type}#{@time}\n\n" +
      "#{@sets}\n\n" +
      "#{bbweight}" +
      "#{kbweight}" +
      "#{height}" +
      "#{slamweight}" +
      "#{wallweight}"
    end
  end

end