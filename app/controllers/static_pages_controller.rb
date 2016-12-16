class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @post = current_user.posts.build
      if params[:tag]
        @search = Post.tagged_with(params[:tag]).search(params[:q])
        @feed_items = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      elsif params[:q].blank?
        @search = current_user.feed.search(params[:q])
        @feed_items = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      else 
        @search = Post.search(params[:q])
        @feed_items = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      end
    else
        @feed_items = Post.limit(5)
    end
  end

  def about
  end
  
  def contact
  end
  
end

private 

  # Defines feed
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                OR user_id = :user_id", user_id: id)
  end