class MixtapesSong < ActiveRecord::Base
  attr_accessible :track_number
  belongs_to :mixtape
  belongs_to :song

  before_create :set_track_number

  def set_track_number
    self.track_number = mixtape.songs.all.length + 1
  end
end
