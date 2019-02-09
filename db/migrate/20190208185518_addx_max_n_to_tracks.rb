class AddxMaxNToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :xMaxN, :integer
  end
end
