class AddOpenToCounterOffer < ActiveRecord::Migration[5.1]
  def change
    add_column :counter_offers, :open, :boolean
  end
end
