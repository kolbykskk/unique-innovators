class CounterOffersController < ApplicationController

  def new
    @CounterOffer = CounterOffer.new
  end

  def create
    @CounterOffer = CounterOffer.new
    @CounterOffer.user = current_user
    @gig = Gig.find(params[:gig_id])
    @CounterOffer.gig = @gig
    @CounterOffer.accepted = false
    @CounterOffer.declined = false
    @CounterOffer.value = params[:counter_offer][:value]
    @CounterOffer.seller = @gig.user_id
    @CounterOffer.open = true

    if @CounterOffer.save
      flash[:notice] = "Successfully sent counter offer! You can check on it's status in your dashboard."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Counter offer must be a valid amount!"
      puts @CounterOffer.errors.messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @CounterOffer = CounterOffer.find(params[:id])

    if @CounterOffer.destroy
      flash[:notice] = "Successfully canceled counter offer."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Could not cancel counter offer."
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @CounterOffer = CounterOffer.find(params[:id])
    if params[:counter_offer][:accepted]
      @CounterOffer.accepted = params[:counter_offer][:accepted]
      @CounterOffer.open = false
    else
      @CounterOffer.declined = params[:counter_offer][:declined]
      @CounterOffer.open = false
    end

    if @CounterOffer.save
      if params[:counter_offer][:accepted]
        flash[:notice] = "Successfully accepted counter offer. Buyer can now purchase for the new price."
      else
        flash[:notice] = "Successfully declined counter offer."
      end
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Could not accept counter offer."
      redirect_back(fallback_location: root_path)
    end
  end

end
