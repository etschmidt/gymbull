class FavoritePostsController < ApplicationController
	before_action :logged_in_user, :set_post

  def create
    Favorite.create(favorited: @post, user: current_user)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @post.id, user_id: current_user.id).first.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end
  
  private
  
  def set_post
	  @post = Post.find(params[:post_id] || params[:id])
  end
  
end