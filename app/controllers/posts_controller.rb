class PostsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,  only: [:edit, :update, :destroy]
    
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @post.destroy
    flash[:warning] = "Post deleted"
    redirect_to root_url
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: @post.id).order("created_at ASC")
    if !logged_in?
      flash.now[:info] = "Log in to see all Users, Gyms, and other content"
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def index
    render :home
  end
  
   private
   
   def post_params
     params.require(:post).permit(:post_type, :title, :content, :picture, :body_parts,
                                  :duration, :equipment, :calories, :protein,
                                  :fat, :carbs, :ingredients, :tag_list )
   end
   
   def correct_user
     if current_user.admin?
       @post = Post.find_by(id: params[:id])
     else
       @post = current_user.posts.find_by(id: params[:id])
       redirect_to root_url if @post.nil?
     end
   end
    
end