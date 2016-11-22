module PostsHelper
    
# Returns true for given post_type
  def post?(post)
    post.post_type == "post"
  end
  
  def workout?(post)
    post.post_type == "workout"
  end 
  
  def meal?(post)
    post.post_type == "meal"
  end
  
end
