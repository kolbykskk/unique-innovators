class AddGalleryToGigs < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :gallery, :string
  end
end
