class SessionsController < ApplicationController
  def new
    redirect_to admin_events_path if current_user
  end

  def create
    user = User.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to admin_events_path
    else
      redirect_to unauthorized_path
    end
  end

  def unauthorized
  end

  def logout 
    sign_out
    redirect_to root_path
  end
end