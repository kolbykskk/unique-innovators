class AddColumnsToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :latitude, :float
    add_column :gigs, :longitude, :float
  end
end
