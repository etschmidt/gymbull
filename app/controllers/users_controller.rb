class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index_gyms
    @search = User.where(account_type: "gym").search(params[:q])
    @users = @search.result.paginate(page: params[:page], :per_page => 30)
  end
  
  def index_users
    @search = User.where(account_type: "user").search(params[:q])
    @users = @search.result.paginate(page: params[:page], :per_page => 30)
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
  end
  
  def new
    @user = User.new
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
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.friendly.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def favorite_posts
    @title = "Favorites"
    @user = User.friendly.find(params[:id])
    @posts = @user.favorite_posts
    render 'favorite_posts/show'
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :picture, :email, :location, :about, 
                                   :height, :weight, :goals, :prs, :quals,
                                   :password, :password_confirmation,
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
   
end