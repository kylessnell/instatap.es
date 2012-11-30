class Song < ActiveRecord::Base
  attr_accessible  :artist, :title, :tiny_id, :youtube_id
  has_many :mixtapes_songs
  has_many :mixtapes, :through => :mixtapes_songs


end
