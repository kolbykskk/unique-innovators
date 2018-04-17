class GigsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

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
      redirect_to gigs_path
    else
      flash[:alert] = "An error occurred. \"#{@gig.title}\" could not be deleted."
      redirect_to @gig
    end
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def index
    if params[:location].present?
      begin
        @gigs = Gig.where("title LIKE ? AND location LIKE ?", "%#{params[:search]}%", "#{Gig.near(params[:location], params[:radius] || 50)[0].location}").page(params[:page]).per(15)
      rescue NoMethodError => e
        @gigs = Gig.where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(15)
        flash[:alert] = "No gigs were found with that location. Showing results for your search term instead."
      rescue ArgumentError => e
        sleep 2
        retry
      end
    else
      @gigs = Gig.where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(15)
    end
  end

  private
  def gig_params
    params.require(:gig).permit(:title, :description, :location, :category, :delivery_time, :allow, {gallery: []})
  end
end
