class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      # I'm definitely sure this should be in a private method defined at the bottom

      following_ids = "SELECT followed_id FROM relationships
                       WHERE  follower_id = :user_id"
      @activities = PublicActivity::Activity
        .order("created_at desc").limit(10)
        .where("owner_id IN (#{following_ids})
                  OR owner_id = :user_id
                  OR recipient_id = :user_id", 
                  user_id: current_user.id)
                
    # but this is a good place for everything else...
      @post = current_user.posts.build
      if params[:tag]
        @search = Post.tagged_with(params[:tag]).search(params[:q])
        @feed_items = @search.result.paginate(page: params[:page], per_page: 15)
      elsif params[:q].blank?
        @search = current_user.feed.search(params[:q])
        @feed_items = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      else 
        @search = Post.search(params[:q])
        @feed_items = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      end
    else
        @feed_items = Post.where(post_type: ["workout", "meal"]).limit(5)
    end
    

  end
  
  def alltags
    @title = "All tags"
  end

  def about
    @title = "About"
  end
  
  def contact
    @title = "Contact"
  end
  
  def survey
    @title = "Survey"
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