require 'rails_helper'

RSpec.describe Gig, type: :model do
  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { is_expected.to validate_length_of(:title).is_at_most(75) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:description).is_at_least(50) }
  it { is_expected.to validate_length_of(:description).is_at_most(1000) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:delivery_time) }
  it { is_expected.to validate_presence_of(:allow) }

end
