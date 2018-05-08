class PayoutsController < ApplicationController
  def create
    @user = current_user
    @payout = @user.payouts.build(payout_params)
    @payout.completed = false

    if @payout.save
      flash[:notice] = "Successfully requested payout."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Failed to request payout."
      redirect_back(fallback_location: root_path)
    end

  end

  def update
    @payout = Payout.find(params[:id])
    @payout.assign_attributes(completed: true)
    @gigs = Gig.where(user: @payout.user)
    @gigs.each do |gig|
      gig.balance = 0
      gig.save!
    end

    if @payout.save
      flash[:notice] = "Successfully marked payout as complete."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Failed to mark payout as complete."
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def payout_params
    params.permit(:email, :amount)
  end
end
