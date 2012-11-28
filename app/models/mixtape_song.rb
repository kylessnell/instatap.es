class MixtapeSong < ActiveRecord::Base
  attr_accessible :track_number
  belongs_to :mixtape
  belongs_to :song
end
