class Mixtape < ActiveRecord::Base
  attr_accessible :name, :song_ids, :skin
  belongs_to :user
  has_many :tracks
  has_many :songs, :through => :tracks
  before_save :create_url

  self.include_root_in_json = false

  def song_ids=(new_song_ids)
    tracks.delete_all
    new_song_ids.each_with_index do |song_id|
      songs << Song.find(song_id)
    end
  end

  def song_ids
    songs.pluck(:id)
  end

private

  def create_url
    self.url = SecureRandom.hex(3)
  end
end
