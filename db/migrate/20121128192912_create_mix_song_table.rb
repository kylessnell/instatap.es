class CreateMixSongTable < ActiveRecord::Migration
  def change
    create_table :mixtapes_songs do |t|
      t.integer :user_id
      t.integer :mixtape_id
      t.integer :track_number
    end
  end
end
