class Mixtape < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :mixtapes_songs
  has_many :songs, :through => :mixtapes_songs
end
