class CommentsController < ApplicationController
	before_action :find_post
	before_action :find_comment, only: [:destroy, :edit, :update]
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,  only: :destroy
	
	def create
		@comment = @post.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.save
		
		if @comment.save
			@comment.create_activity :create, owner: current_user
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
	
	def destroy
		@comment.destroy
		redirect_to post_path(@post)
	end
	
=begin It would be best to update comments as a partial on the post#show page, 
but I'm not around to that yet

	def edit
	
	end
	
	def update
		if @comment.update(params[:comment].permit(:content))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end
	
=end 

	private
	
	def find_post
		@post = Post.find(params[:post_id])
	end
	
	def find_comment
		@comment = @post.comments.find(params[:id])
	end
	
	def correct_user
  	if current_user.admin?
  	  @comment = @post.comments.find(params[:id])
  	else
  	  @comment = current_user.comments.find(params[:id])
	    redirect_to root_url if @comment.nil?
  	end
	end
	
end
