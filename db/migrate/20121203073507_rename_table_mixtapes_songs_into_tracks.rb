class RenameTableMixtapesSongsIntoTracks < ActiveRecord::Migration
  def change
    rename_table :mixtapes_songs, :tracks
  end 
end
