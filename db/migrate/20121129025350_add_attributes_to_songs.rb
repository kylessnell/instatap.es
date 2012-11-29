class AddAttributesToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :tiny_id, :string
    add_column :songs, :youtube_id, :string
  end
end
