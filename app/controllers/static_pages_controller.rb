class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      
    #  @activities = PublicActivity::Activity.order("created_at desc").limit(10)
      following_ids = "SELECT followed_id FROM relationships
                      WHERE  follower_id = :user_id"

      @activities = PublicActivity::Activity
        .order("created_at desc").limit(10)
        .where("owner_id IN (#{following_ids})
                  OR recipient_id = :user_id", 
                  user_id: current_user.id)


      @post = current_user.posts.build
      if params[:tag]
        @feed_items = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 15)
      elsif params[:q].blank?
        @feed_items = current_user.feed.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      else 
        @feed_items = Post.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      end
    else
      if params[:tag]
        @search = Post.where(post_type: ["workout", "meal"]).tagged_with(params[:tag]).search(params[:q])
        @feed_items = @search.result.paginate(page: params[:page], per_page: 15)
      elsif params[:q].blank?
        @search = Post.where(post_type: ["workout", "meal"]).search(params[:q])
        @feed_items = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      else 
        @search = Post.where(post_type: ["workout", "meal"]).search(params[:q])
        @feed_items = @search.result.includes(:tags).all.paginate(page: params[:page], per_page: 15)
      end
    end
    
  end

  def about
    @title = "About"
  end
  
  def alltags
    @title = "All tags"
  end
 
  def calculator
    @title = "Calculator"
  end  
  
  def contact
    @title = "Contact"
  end
  
  def survey
    @title = "Survey"
  end
  
  def sample
    @posts = Post.where(post_type: ["workout", "meal"]).limit(15)
    flash.now[:info] = "<b>Log in</b> to save content that you 'mire here".html_safe
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
