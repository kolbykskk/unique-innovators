class AddTypeToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :type, :string
  end
end
