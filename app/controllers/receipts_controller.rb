class ReceiptsController < ApplicationController
  def update
    @receipt = Receipt.find(params[:id])
    @receipt.assign_attributes(completed: true)
    @gig = @receipt.gig
    @gig.balance += @receipt.amount
    @gig.save!

    if @receipt.save
      flash[:notice] = "Successfully marked gig as complete!"
      redirect_to "/users/dashboard/#{current_user.id }"

    else
      flash[:alert] = "Failed to mark gig as complete."
      redirect_to "/users/dashboard/#{current_user.id }"
    end
  end
end
