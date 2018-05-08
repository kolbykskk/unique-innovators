class CreateCounterOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :counter_offers do |t|
      t.boolean :accepted
      t.boolean :declined
      t.references :user, foreign_key: true
      t.references :gig, foreign_key: true

      t.timestamps
    end
  end
end
