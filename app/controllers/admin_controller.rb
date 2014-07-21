class AdminController < ApplicationController
  before_action :ensure_logged_in

  def ensure_logged_in
    redirect_to unauthorized_path unless current_user
  end
end