class Song < ActiveRecord::Base
  attr_accessible  :artist, :title
  has_many :mixtapes_songs
  has_many :mixtapes, :through => :mixtapes_songs
end
