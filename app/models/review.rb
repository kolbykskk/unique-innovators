class Review < ApplicationRecord
  belongs_to :user
  belongs_to :gig

  validates :title, presence: true
  validates :description, presence: true
  validates :rating, presence: true

  default_scope { order(created_at: :desc) }

end
