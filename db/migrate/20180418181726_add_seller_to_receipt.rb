class AddSellerToReceipt < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :seller, :string
  end
end
