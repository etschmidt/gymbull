ActiveRecord::Base.connection_pool.with_connection do
	wod = Wod.new
	
	post = Post.new(user_id: 128,
						 post_type: "workout", 
						 content: wod.print_ss + wod.print_wod, tag_list: "wod")	
	post.save
end