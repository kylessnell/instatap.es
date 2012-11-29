class AddApiIdToSong < ActiveRecord::Migration
  def change
    add_column :songs, :api_id, :string
  end
end
