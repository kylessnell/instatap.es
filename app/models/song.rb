class Song < ActiveRecord::Base
  attr_accessible  :artist, :title, :tiny_id, :youtube_id
  has_many :tracks
  has_many :mixtapes, :through => :tracks
end
