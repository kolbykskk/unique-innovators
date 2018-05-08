class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @gig = Gig.find_by_id(params[:gig_id])
    favorite = current_user.favorites.build(gig: @gig)

    if favorite.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    @gig = Gig.find_by_id(favorite.gig_id)

    if favorite.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
