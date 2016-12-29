class FavoritePostsController < ApplicationController
	before_action :logged_in_user, :set_post

# I wanted these to be proper AJAX calls that just reload partials, but I couldn't
# figure that out; at least now it doesn't jump to the top of the page

  def create
    Favorite.create(favorited: @post, user: current_user)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js {render inline: "location.reload();" }
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @post.id, user_id: current_user.id).first.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js {render inline: "location.reload();" }
    end
  end
  
  private
  
  def set_post
	  @post = Post.find(params[:post_id] || params[:id])
  end
  
end