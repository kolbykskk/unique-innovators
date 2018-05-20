class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :competition
  acts_as_votable

  validates :category, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :gallery, presence: true

  mount_uploaders :gallery, GalleryUploader
  serialize :gallery, JSON
end
