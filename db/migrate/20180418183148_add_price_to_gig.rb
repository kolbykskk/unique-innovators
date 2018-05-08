class AddPriceToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :price, :decimal
  end
end
