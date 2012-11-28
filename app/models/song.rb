class Song < ActiveRecord::Base
  attr_accessible  :artist, :title, :mixtape_id
  belongs_to :mixtape
end
