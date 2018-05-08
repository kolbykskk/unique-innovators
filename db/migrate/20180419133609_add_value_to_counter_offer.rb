class AddValueToCounterOffer < ActiveRecord::Migration[5.1]
  def change
    add_column :counter_offers, :value, :decimal
  end
end
