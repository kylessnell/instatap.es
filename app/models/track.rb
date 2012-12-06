class Track < ActiveRecord::Base
  attr_accessible :position
  belongs_to :mixtape
  belongs_to :song
  before_validation :set_position, :on => :create
  validates_presence_of :position


  # look at acts_as_list
  def set_position
    self.position = mixtape.songs.all.length + 1
  end
end
