class Mixtape < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :mixtapes_songs
  has_many :songs, :through => :mixtapes_songs

  def song_ids=(song_ids)
    self.songs = Song.find_all_by_api_id(song_ids)
    # this should be:
    # self.songs = Song.find_all_by_id(song_ids)
  end
end
