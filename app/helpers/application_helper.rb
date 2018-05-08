module ApplicationHelper
  def can_write_review(gig_id)
    if current_user
      @user = current_user
      @receipts = @user.receipts.where(gig_id: gig_id)
      @reviews = @user.reviews.where(gig_id: gig_id)
    end
    #User purchased this gig before?
    def purchased_before?
      if @receipts
        true
      end
    end

    def final
      if purchased_before?
        @receipt = @receipts.first
        if @receipt
          if @receipt.completed == true && @reviews.count < @receipts.count
            true
          end
        end
      end
    end

    final

  end

  def review_average(gig_id)
    @user = current_user
    @reviews = Review.where(gig_id: gig_id)
    arr = []
    @reviews.each do |review|
      arr.push(review.rating.to_i)
    end
    arr.inject(0.0) {|sum, el| sum + el} / arr.size
  end

  def review_average2(user_id)
    @user = User.find_by_id(user_id)
    @gigs = Gig.where(user_id: @user.id)
    @reviews = Review.where(gig_id: @gigs)
    arr = []
    @reviews.each do |review|
      arr.push(review.rating.to_i)
    end
    arr.inject(0.0) {|sum, el| sum + el} / arr.size
  end
end
