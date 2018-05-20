class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :category
      t.string :title
      t.text :description
      t.boolean :active
      t.string :gallery

      t.timestamps
    end
  end
end
