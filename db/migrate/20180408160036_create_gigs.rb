class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.string :title
      t.string :category
      t.string :location
      t.text :description
      t.string :delivery_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
