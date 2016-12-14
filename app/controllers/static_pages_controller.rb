class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @post = current_user.posts.build
      if params[:tag]
        @feed_items = current_user.feed.tagged_with(params[:tag])
      else
        @feed_items = current_user.feed
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
