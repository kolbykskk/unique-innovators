class CreatePayouts < ActiveRecord::Migration[5.1]
  def change
    create_table :payouts do |t|
      t.references :user, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
