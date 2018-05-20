class Competition < ApplicationRecord
  has_many :entries

  def time_remaining
    Date.today
  end

  def self.competition_name
    return Date.today.strftime("%B")
  end
end
