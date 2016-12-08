class GymsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :gym_admin,      only: [:edit, :update]                                      
  
  def index
    @search = Gym.search(params[:q])
    @gyms = @search.result.paginate(page: params[:page], :per_page => 30)
  end

  def show
    @gym = Gym.find(params[:id])
    @post = @gym.posts.build
    @posts = @gym.posts
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      redirect_to @gym
      flash[:success] = "Gym Created!"
    else
      render 'new'
    end
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    if @gym.update_attributes(gym_params)
      flash[:success] = "Gym Updated!"
      redirect_to @gym
    else
      render 'edit'
    end
  end

  def destroy
    Gym.find(params[:id]).destroy
    flash[:success] = "Gym deleted"
    redirect_to gyms_url

  end
  
  private
  
    def gym_params
      params.require(:gym).permit(:name, :picture, :email, :location, :about, 
                                   :focus, :hours, :pricing, :equipment, 
                                   :classes, :gym_admin)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    # Confirms a gym admin
    def gym_admin
      @gym = Gym.find_by(params[:id])
      redirect_to(root_url) unless current_user.id == @gym.gym_admin
    end
    
    def gym_post?
      :gym_post?
    end
    
    # Confirms logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
  
end
