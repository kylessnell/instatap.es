class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.string						:artist
    	t.string						:title
    	t.integer						:mixtape_id				
      t.timestamps
    end
  end
end
