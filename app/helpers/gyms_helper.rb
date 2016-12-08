module GymsHelper
	
	def picture_for(gym, options = {})
    size = options[:size]
    if gym.picture? 
      image_tag(gym.picture, alt: gym.name, size: size, class: "picture")
    else
      image_tag("gym-clipart-2.jpg", size: size, class: "picture")
    end
	end
	
	# Returns true if the given user is a gym admin.
  def gym_admin?(user)
    user.id == gym.gym_admin
  end
	
end