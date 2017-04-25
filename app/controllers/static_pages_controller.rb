class StaticPagesController < ApplicationController
  
  before_action :logged_in_user, only: [:home]
  
  def home
      
  #  @activities = PublicActivity::Activity.order("created_at desc").limit(10)
    following_ids = "SELECT followed_id FROM relationships
                    WHERE  follower_id = :user_id"

    @activities = PublicActivity::Activity
      .order("created_at desc").limit(10)
      .where("owner_id IN (#{following_ids})
                OR recipient_id = :user_id", 
                user_id: current_user.id)


    @post = current_user.posts.build
    
    # this is for the posts user will see before following any other users
    @posts = Post.limit(15)
    
    if params[:tag]
      @feed_items = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 15)
    else # normal, default feed
      @feed_items = current_user.feed.includes(:tags).all.paginate(page: params[:page], per_page: 15)
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
  
  def letsencrypt1
    render text: "vPm1E8Lk1tr2pU0kSVhDnWnB5JIrmuYQx17pbsKEwxI.bgMz6QxSusVZDSXyUxli-d-u6JCn4GNH5a3NQ4SQ7to"
  end
  
  def letsencrypt2
    render text: "RQ5SDEpnhY0aY29Y5Dh55NanB1Zv_SEqKhkyMkGpR3E.bgMz6QxSusVZDSXyUxli-d-u6JCn4GNH5a3NQ4SQ7to"
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
