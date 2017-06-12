module ApplicationHelper
    
  # Returns full title of pages
  def full_title(page_title = '')
    base_title = "GymBull"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
    
  def meta_description(page_desc ='')
    base_desc = "A Culture of Fitness. An online 
                community dedicated to sharing exercise
                and utrition information around the world"

    if page_desc.empty?
      base_desc
    else
      page_desc
    end
  end

  def twitter_pic(page_pic ='')
    base_pic = "https://www.gymbull.com/assets/BullsHead2-300px-40eb7585a95ae04d8582f8a6335d8418673f2de31f699e4f37aa6af50f4537a7.png"

    if page_pic.empty?
      base_pic
    else
      page_pic
    end
  end

end
