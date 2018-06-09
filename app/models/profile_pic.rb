class ProfilePic < ApplicationRecord
  belongs_to :user

  mount_uploader :uploader, UploaderUploader

end
