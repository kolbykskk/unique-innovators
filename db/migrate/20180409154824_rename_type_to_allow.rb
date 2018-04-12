class RenameTypeToAllow < ActiveRecord::Migration[5.1]
  def change
    rename_column(:gigs, :type, :allow)
  end
end
