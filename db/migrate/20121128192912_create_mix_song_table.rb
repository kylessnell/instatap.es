class CreateMixSongTable < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :user_id
      t.integer :mixtape_id
      t.integer :position
    end
  end
end
