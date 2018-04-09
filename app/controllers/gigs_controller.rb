class GigsController < ApplicationController
  def new
    @gig = Gig.new
  end

  def create
    @gig = current_user.gigs.build(gig_params)

    if @gig.save
      flash[:notice] = "Gig successfully created!"
      redirect_to @gig
    else
      flash[:alert] = "An error occured. Gig could not be created."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end

  private
  def gig_params
    params.require(:gig).permit(:title, :description, :location, :category, :delivery_time)
  end
end
