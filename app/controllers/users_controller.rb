class UsersController < ApplicationController
  def show
    @user = User.includes(:events).first
    @events = @user.events
  end
end