class PostsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,  only: :destroy
  
  def create_user_post 
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def create_gym_post
    @post = gym.posts.build(post_params)
     if @post.save
      flash[:success] = "Post!"
      redirect_to "/gyms/#{gym.id}"
     else
      @feed_items = []
      render 'static_pages/home'
     end
  end
  
  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end
  
  def destroy_gym_post
    @post = gym.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer
  end
   
   private
   
   def post_params
     params.require(:post).permit(:post_type, :title, :content, :picture, :body_parts,
                                  :duration, :equipment, :calories, :protein,
                                  :fat, :carbs, :ingredients, :tag_list,
                                  :postable_id, :postable_type)
   end
   
   def correct_user
     @post = current_user.posts.find_by(id: params[:id])
     redirect_to root_url if @post.nil?
   end
   
   def gym
     @gym = Gym.find_by(params[:id])
   end
    
end