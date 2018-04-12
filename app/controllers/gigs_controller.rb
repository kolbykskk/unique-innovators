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
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    @gig.assign_attributes(gig_params)

    if @gig.save
      flash[:notice] = "Gig was updated."
      redirect_to @gig
    else
      flash[:alert] = "An error occurred. Gig could not be updated."
      render :edit
    end
  end

  def destroy
    @gig = Gig.find(params[:id])

    if @gig.destroy
      flash[:notice] = "\"#{@gig.title}\" was deleted successfully"
      redirect_to gig_path
    else
      flash[:alert] = "An error occurred. \"#{@gig.title}\" could not be deleted."
      redirect_to @gig
    end
  end

  def show
    @gig = Gig.find(params[:id])
    @lat = @gig.latitude
    @lng = @gig.longitude
  end

  def index
    @gigs = Gig.all
  end

  private
  def gig_params
    params.require(:gig).permit(:title, :description, :location, :category, :delivery_time, :allow, {gallery: []})
  end
end
