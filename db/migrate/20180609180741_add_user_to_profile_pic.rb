class AddUserToProfilePic < ActiveRecord::Migration[5.1]
  def change
    add_reference :profile_pics, :user, foreign_key: true
  end
end
