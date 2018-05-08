class UsersController < ApplicationController

  def dashboard
    @user = current_user
  end
  def show
    @user = User.find(params[:id])
    @gigs = Gig.where(user_id: @user.id, event: false)
    @events = Gig.where(user_id: @user.id, event: true)
  end
end
