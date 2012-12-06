class Song < ActiveRecord::Base
  attr_accessible  :artist, :title, :tiny_id, :youtube_id
  has_many :tracks
  has_many :mixtapes, :through => :tracks
  # validates_presence_of :title, :artist, :tiny_id, :youtube_id
end

