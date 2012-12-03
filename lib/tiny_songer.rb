# We will call this code like this:
# TinySonger.search(params[:query])
# in 'mixtape#create'

require_relative '../config/api_keys_config.rb'

FACEBOOK_KEY = '482081311836995'
FACEBOOK_SECRET = 'db541a0ee6682b9802cb44523c56babf'
TINYSONG_API_KEY = "0af53736101aebb91f579527433c9208"
YOUTUBE_API_KEY = "AI39si6i1YvfcT64qFK06lhB9oT_4NuGkRnSHmyrH7XmFkOx6jtLimBtDl-NOX7-RSqqcBKH-RpuJHae3Xo6ulUT8paIk9Nh1w"

module TinySonger
  def self.search(query)
    all_songs(search_results(query))
  end

  def self.search_results(query)
    query = CGI::escape(query)
    key = TINYSONG_API_KEY
    JSON.parse(RestClient.get"http://tinysong.com/s/#{query}?format=json&key=#{key}")
  end

  def self.all_songs(songs_data)
    songs_data.collect { |song| Result.new(song) }
  end
end

class Result
  def initialize(hash_data)
    @hash_data = hash_data
  end

  def tiny_id
    @hash_data["SongID"]
  end

  def title
    @hash_data["SongName"]
  end

  def artist
    @hash_data["ArtistName"]
  end

  def album
    @hash_data["AlbumName"]
  end

  def youtube_id
    self.class.get_youtube_id(artist, title)
  end

  def self.get_youtube_id(artist, title)
    video_data = youtube_client.videos_by(:query => ("#{artist} #{title}"), :categories => [:music])
    video_data.videos.first.video_id.split(':').last
  end

  def youtube_client
    self.class.youtube_client
  end

  def self.youtube_client
    @youtube_client ||= YouTubeIt::Client.new(:dev_key => YOUTUBE_API_KEY)
  end
end
