class AddEmailToPayout < ActiveRecord::Migration[5.1]
  def change
    add_column :payouts, :email, :string
  end
end
