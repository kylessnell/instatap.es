class Track < ActiveRecord::Base
  attr_accessible :position
  belongs_to :mixtape
  belongs_to :song

  before_create :set_position

  def set_position
    self.position = mixtape.songs.all.length + 1
  end
end
