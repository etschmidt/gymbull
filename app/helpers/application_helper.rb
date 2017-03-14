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
    
end
