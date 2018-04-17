class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @gig = Gig.find_by_id(params[:gig_id])
    favorite = current_user.favorites.build(gig: @gig)

    if favorite.save
      flash[:notice] = "Gig favorited."
      redirect_to @gig
    else
      flash[:alert] = "Favoriting failed."
      redirect_to @gig
    end
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    @gig = Gig.find_by_id(favorite.gig_id)

    if favorite.destroy
      flash[:notice] = "Gig unfavorited."
      redirect_to @gig
    else
      flash[:alert] = "Unfavoriting failed."
      redirect_to @gig
    end
  end
end
