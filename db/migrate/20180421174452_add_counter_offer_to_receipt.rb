class AddCounterOfferToReceipt < ActiveRecord::Migration[5.1]
  def change
    add_reference :receipts, :counter_offer, foreign_key: true
  end
end
