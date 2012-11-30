class AddSongIdToMixtapesSongs < ActiveRecord::Migration
  def change
    add_column :mixtapes_songs, :song_id, :integer
  end
end
