module GymsHelper
	
	def picture_for(gym, options = {})
    size = options[:size]
    if gym.picture? 
      image_tag(gym.picture, alt: gym.name, size: size, class: "picture")
    else
      image_tag("gym-clipart-2.jpg", size: size, class: "picture")
    end
  end
	
end