class GymsController < ApplicationController
  def index
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
