class GymsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  
  def index
  end

  def show
    @gym = Gym.find(params[:id])
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
  end
  
  private
  
    def gym_params
      params.require(:gym).permit(:name, :picture, :email, :location, :about, 
                                   :focus, :hours, :pricing, :equipment, 
                                   :classes)
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
  
end
