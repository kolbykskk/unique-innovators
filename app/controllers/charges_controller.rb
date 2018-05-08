class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: params[:description],
      amount: "<%= params[:price] * 100%>"
      }
  end

  def create
    puts "$$$$$$$$$#{params[:counter_offer_id]}"
    @amount = params[:price] * 100
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: @amount.to_i.floor,
      description: params[:description],
      currency: 'usd'
    )

    receipt = current_user.receipts.build(gig_id: params[:gig], counter_offer_id: params[:counter_offer], amount: params[:price], seller: Gig.find_by_id(params[:gig]).user_id, completed: false)
    if receipt.gig.event == true
      receipt.completed = true
      receipt.gig.balance += receipt.amount
    end
    receipt.save!
    receipt.gig.save!
    flash[:notice] = "Thank you for your purchase, #{current_user.username}!"
    redirect_to "/users/dashboard/#{current_user.id}" # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

end
