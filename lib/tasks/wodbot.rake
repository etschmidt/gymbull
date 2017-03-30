task :testwod => :environment do
	wod = Wod.new
	
	print wod.print_ss
	print wod.print_wod
end

task :testppl => :environment do
	ppl = Ppl.new
	ppl.isolates
	ppl.compounds
	
	print ppl.print_ppl
end

task :postwod => :environment do
	wod = Wod.new
	
	post = Post.new(user_id: 128,
						 post_type: "workout", 
						 content: wod.print_ss + wod.print_wod, tag_list: "wod")	
	post.save
end