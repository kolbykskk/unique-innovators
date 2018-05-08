class CounterOffer < ApplicationRecord
  belongs_to :user
  belongs_to :gig

  default_scope { order(created_at: :desc) }


  validates :value, numericality: { greater_than: 0 }, length: { maximum: 5 }, presence: true
end
