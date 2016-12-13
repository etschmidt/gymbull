module UsersHelper
    
  def picture_for(user, options = {})
    size = options[:size]
    if user.picture? 
      image_tag(user.picture, alt: user.name, size: size, class: "picture")
    else
      image_tag("gym-clipart.jpg", size: size, class: "picture")
    end
  end
  
    
  #True if user account type is a gym
  def gym?(user)
    user.account_type == "gym"
  end
  
end
