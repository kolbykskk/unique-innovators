class AddCompetitionToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :competition, :boolean
  end
end
