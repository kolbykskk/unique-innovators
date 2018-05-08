class AddCompletedToPayout < ActiveRecord::Migration[5.1]
  def change
    add_column :payouts, :completed, :boolean
  end
end
