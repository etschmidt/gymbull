class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :expire_hsts
  before_action :random_workout
  
  include PublicActivity::StoreController
  
  include SessionsHelper
  
  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url
      end
    end
    
    def expire_hsts
      response.headers["Strict-Transport-Security"] = 'max-age=0'
    end

    def random_workout
      @random = Post.unscoped.order("RANDOM()").first
    end
  
end
