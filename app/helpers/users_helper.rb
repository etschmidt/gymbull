module UsersHelper
    
  def profile_picture_for(user, options = {})
    profile = 200
    size = options[:size]
    if gym?(user)
      if user.picture? 
        image_tag(user.picture_url(size).to_s, class: "picture")
      else
        image_tag("gym-clipart.jpg", size: profile, class: "picture")
      end
    else
      if user.picture? 
        image_tag(user.picture_url(size).to_s, class: "picture")
      else
        image_tag("user-clipart.jpg", size: profile, class: "picture")
      end
    end
  end
  
  def tiny_picture_for(user, options = {})
    tiny = 30
    size = options[:size]
    if gym?(user)
      if user.picture? 
        image_tag(user.picture_url(size).to_s, class: "picture")
      else
        image_tag("gym-clipart.jpg", size: tiny, class: "picture")
      end
    else
      if user.picture? 
        image_tag(user.picture_url(size).to_s, class: "picture")
      else
        image_tag("user-clipart.jpg", size: tiny, class: "picture")
      end
    end
  end
  
  #True if user account type is a gym
  def gym?(user)
    user.account_type == "gym"
  end
  
end
