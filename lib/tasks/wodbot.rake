task :testpost => :environment do
	wod = Wod.new
	
	print wod.print_ss
	print wod.print_wod
end

task :post => :environment do
	wod = Wod.new
	
	post = Post.new(user_id: 128,
						 post_type: "workout", 
						 content: wod.print_ss + wod.print_wod, tag_list: "wod")	
	post.save
end