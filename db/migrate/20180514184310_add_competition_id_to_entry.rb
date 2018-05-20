class AddCompetitionIdToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :competition_id, :integer
  end
end
