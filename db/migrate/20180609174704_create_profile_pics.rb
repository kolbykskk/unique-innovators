class CreateProfilePics < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_pics do |t|
      t.string :upload

      t.timestamps
    end
  end
end
