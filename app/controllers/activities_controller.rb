class ActivitiesController < ApplicationController
  def index
    @title = "All activity"
    if current_user.admin?
      @activities = PublicActivity::Activity.order("created_at desc").paginate(page: params[:page], per_page: 50)
    else
      redirect_to root_path
    end
  end
end