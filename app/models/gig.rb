class Gig < ApplicationRecord

  default_scope { order(created_at: :desc) }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many :CounterOffers
  has_many :reviews

  mount_uploaders :gallery, GalleryUploader
  serialize :gallery, JSON
  validate :gallery_count

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :allow, acceptance: { accept: ['Online or Meetups', 'Online Only', 'Meetups Only'] }, presence: true
  validates :location, presence: true, if: :check_if_location_required
  validates :delivery_time, acceptance: { accept: ApplicationController.helpers.delivery_time }, presence: true


private
  def check_if_location_required
    allow != 'Online Only'
  end

  def gallery_count
    errors.add(:gallery, "must have at least 1 image/video uploaded!") if self.gallery.count < 1
    errors.add(:gallery, "can only upload up to 6 images/videos.") if self.gallery.count > 6
  end

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

end
