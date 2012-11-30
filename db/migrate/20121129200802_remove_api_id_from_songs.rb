class RemoveApiIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :api_id
  end
end
