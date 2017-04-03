namespace :wod do
	task :test => :environment do
		wod = Wod.new
		
		print wod.print_ss
		print wod.print_wod
	end
	
	task :post => :environment do
		wod = Wod.new
		
		post = Post.new(user_id: 128,
							 post_type: "workout", 
							 content: wod.print_ss + wod.print_wod, 
							 tag_list: "wod")	
		post.save
	end
end

namespace :ppl do

	task :test => :environment do
		ppl = Ppl.new
		ppl.isolates
		ppl.compounds
		ppl.muscles
		
		print ppl.print_ppl
	end
	
	task :post => :environment do
		ppl = Ppl.new
		ppl.isolates
		ppl.compounds
		ppl.muscles
		
		post = Post.new(#user_id: 2,
							 user_id: 131,
							 post_type: "workout",
							 title: ppl.title,
							 body_parts: ppl.muscles,
							 duration: 45,
							 content: ppl.print_ppl, 
							 tag_list: ppl.title)	
		post.save
	end
	
end

