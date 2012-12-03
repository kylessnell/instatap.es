class RenameTrackNumberInJustPosition < ActiveRecord::Migration
  def change
    rename_column :tracks, :track_number, :position
  end
end
