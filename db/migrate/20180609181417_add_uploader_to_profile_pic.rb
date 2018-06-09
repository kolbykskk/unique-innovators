class AddUploaderToProfilePic < ActiveRecord::Migration[5.1]
  def change
    add_column :profile_pics, :uploader, :string
  end
end
