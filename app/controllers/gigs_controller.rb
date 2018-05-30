class GigsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :no_create, only: [:new, :create]

  def new
    @user = User.find(params[:user_id])
    @gig = Gig.new
  end

  def create
    @user = User.find(params[:user_id])
    @gig = @user.gigs.build(gig_params)

    if @gig.save
      flash[:notice] = "#{@gig.title} successfully created!"
      redirect_to @gig
    else
      render :new
    end
  end

  def edit
    @gig = Gig.find(params[:id])
    authorize @gig
  end

  def update
    @gig = Gig.find(params[:id])
    authorize @gig
    @gig.assign_attributes(gig_params)

    if @gig.save
      flash[:notice] = "#{@gig.title} successfully updated!"
      redirect_to @gig
    else
      render :edit
    end
  end

  def destroy
    @gig = Gig.find(params[:id])
    authorize @gig

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
    @CounterOffer = CounterOffer.new
  end

  def index
    @arr = ['Web Developer', 'Graphic Designer']
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


  def show_counter_offer
    if current_user
      offer = CounterOffer.where(user_id: current_user.id, gig: Gig.find_by_id(params[:id])).last
      if offer || Gig.find_by_id(params[:id]).user == current_user
        test = current_user && current_user != Gig.find_by_id(params[:id]).user &&
        offer.open == false
        test
      else
        true
      end
    end
  end

  def no_create
    if params[:user_id].to_i == current_user.id.to_i

    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end


  helper_method :show_counter_offer

  private
  def gig_params
    params.require(:gig).permit(:title, :description, :location, :category, :delivery_time, :allow, {gallery: []}, :price, :balance, :event)
  end
end
