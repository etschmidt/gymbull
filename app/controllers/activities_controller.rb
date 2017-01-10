class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc").limit(10)
  end
end
