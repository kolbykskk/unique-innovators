class Payout < ApplicationRecord
  belongs_to :user

  validates :email, presence: true

  default_scope { order(created_at: :desc) }
end
