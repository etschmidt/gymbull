class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated! Time to get SWOLE!"
      redirect_to user
    else
      flash[:danger] = "Shit's fucked up, yo"
      redirect_to root_url
    end
  end
end