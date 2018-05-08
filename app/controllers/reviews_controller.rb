class ReviewsController < ApplicationController
  def create
    @user = current_user
    @review = @user.reviews.build(review_params)
    @review.gig = Gig.find(params[:gig_id])
    @review.rating = params[:rating]

    if @review.save
      flash[:notice] = "Thank you for your review!"
      redirect_back(fallback_location: :root)
    else
      flash[:alert] = "Failed to submit review."
      puts @review.errors.messages
      redirect_back(fallback_location: :root)
    end
  end

  def destroy

  end

  def index
    @gig = Gig.find_by(id: params[:gig_id])
    @review = Review.new
    @reviews = Review.where(gig_id: params[:gig_id])
  end

  private
  def review_params
    params.require(:review).permit(:title, :description)
  end
end
