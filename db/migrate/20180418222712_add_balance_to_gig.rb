class AddBalanceToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :balance, :decimal
  end
end
