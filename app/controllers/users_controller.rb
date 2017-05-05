class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user, only: [:edit, :update, :favorite_posts, :reverse_mires]
  before_action :admin_user, only: :destroy
  
  def index
    @title = 'Users'
    if params[:q].blank?
      @search = recent_users.search(params[:q])
      @users = @search.result.reverse_order.limit(20)
    else
      @search = User.search(params[:q])
      @users =  @search.result.reverse_order.limit(20)
    end
  end
  
  def justjoined
    @title = 'Just Joined'
    @users = User.order(created_at: :desc).limit(20)
  end  
  
  def show
    @user = User.friendly.find(params[:id])
    if !logged_in?
      flash.now[:info] = "Log in to see all Users, Gyms, and other content"
    end
    if params[:tag]
      @posts = @user.posts.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 15)
    else
      @posts = @user.posts.includes(:tags).all.paginate(page: params[:page], per_page: 15)
    end
    
    @suggestions = suggestions.limit(3)
    
  end

  def new
    @user = User.new
    @title = 'Sign up'
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'users/new'
    end
  end
  
  def edit
    @user = User.friendly.find(params[:id])
    @title = 'Edit profile'
  end
  
  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:warning] = "User deleted"
    redirect_to users_url
  end
  
  def following
    @title = "Following"
    @user  = User.friendly.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    @count = "Following " + @user.following.count.to_s + " users"
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.friendly.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    @count = @user.followers.count.to_s + " followers"
    render 'show_follow'
  end
  
  def favorite_posts
    @title = "Mires"
    @user = User.friendly.find(params[:id])
    @posts = @user.favorite_posts
    render 'favorite_posts/show'
  end
  
  def reverse_mires
    @title = "Reverse Mires"
    @user = User.friendly.find(params[:id])
    @posts = @user.favorite_posts.reverse
    render 'favorite_posts/show'
  end

=begin
  def recent_mires
    @title = "Recent Mires"
    @user = User.friendly.find(params[:id])
    @posts = Favorite.where(user_id: current_user.id)
    render 'favorite_posts/show'
  end
=end

  private
    
    def user_params
      params.require(:user).permit(:name, :picture, :email, :location, :about, 
                                   :height, :weight, :goals, :prs, :quals,
                                   :password, :password_confirmation, :email_option,
                                   #these are only for gyms:
                                   :account_type, :focus, :hours, :pricing,
                                   :equipment, :classes)
    end
 
    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.friendly.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    # Confirms logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
    
    #True if user account type is a gym
    def gym?(user)
      user.account_type == "gym"
    end
    
    def recent_users
      recent_posts = "SELECT user_id 
                      FROM posts 
                      ORDER BY created_at ASC" 
      User.where("id IN (#{recent_posts})")
    end
    
    def top_posters
      
      User.joins(:posts).group("posts.user_id").order("count(posts.user_id) asc")
    
    end

    def suggestions
      
      following_ids = "SELECT followed_id FROM relationships
                    WHERE  follower_id = (#{current_user.id})"

      top_posters.where("user_id NOT IN (#{following_ids})")
    end
      

end