class AddSellerToCounterOffer < ActiveRecord::Migration[5.1]
  def change
    add_column :counter_offers, :seller, :integer
  end
end
