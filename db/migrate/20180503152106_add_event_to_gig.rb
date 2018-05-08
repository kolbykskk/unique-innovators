class AddEventToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :event, :boolean
  end
end
