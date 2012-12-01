class Mixtape < ActiveRecord::Base
  attr_accessible :name, :song_ids
  belongs_to :user
  has_many :mixtapes_songs
  has_many :songs, :through => :mixtapes_songs
  before_save :create_mixtape_url

  self.include_root_in_json = false

  def song_ids=(new_song_ids)
    mixtapes_songs.delete_all
    new_song_ids.each_with_index do |song_id|
      songs << Song.find(song_id)
    end
  end

  def song_ids
    songs.pluck(:id)
  end

private

  def create_mixtape_url
    self.mixtape_url = SecureRandom.hex(3)
  end
end
