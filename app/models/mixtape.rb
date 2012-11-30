class Mixtape < ActiveRecord::Base
  attr_accessible :name, :song_ids
  belongs_to :user
  has_many :mixtapes_songs
  has_many :songs, :through => :mixtapes_songs
  before_save :create_mixtape_url

  def song_ids=(song_ids)
    self.songs = Song.where(:youtube_id => song_ids)
  end

  def song_ids
    songs.pluck(:youtube_id)
  end

private

  def create_mixtape_url
    self.mixtape_url = SecureRandom.hex(3)
  end
end
