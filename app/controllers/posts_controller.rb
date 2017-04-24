class PostsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,  only: [:edit, :update, :destroy]
    
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      @post.create_activity :create, owner: current_user
      flash[:success] = "Great Post! Keep up the good work!"
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
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      @post.create_activity :update, owner: current_user
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def index
    if params[:tag]
      @search = Post.tagged_with(params[:tag]).search(params[:q])
      @posts = @search.result.paginate(page: params[:page], per_page: 15)
    elsif params[:q].blank?
      @search = Post.search(params[:q])
      @posts = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
    else 
      @search = Post.search(params[:q])
      @posts = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 500)
      
    end
  end
  
   private
   
   def post_params
     params.require(:post).permit(:post_type, :title, :content, :picture, :youtube_url, :body_parts,
                                  :duration, :equipment, :calories, :protein,
                                  :fat, :carbs, :ingredients, :tag_list, :tag_list => [] )
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