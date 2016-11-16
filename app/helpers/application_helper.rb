module ApplicationHelper
    
  # Returns full title of pages
  def full_title(page_title = '')
    base_title = "Gymbull"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
    
end
