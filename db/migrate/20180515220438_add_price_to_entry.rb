class AddPriceToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :price, :float
  end
end
