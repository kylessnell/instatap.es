# We will call this code like this:

module TinySonger
  def self.search(query)
    all_songs(search_results(query))
  end

  def self.search_results(query)
    query = CGI::escape(query)
    key = ECHONEST_API_KEY
    JSON.parse(RestClient.get"http://developer.echonest.com/api/v4/song/search?api_key=#{key}&artist=#{query}")
  end

  def self.all_songs(songs_data)
    songs_data["response"]["songs"].collect { |song| Result.new(song) }
  end
end

class Result
  def initialize(hash_data)
    @hash_data = hash_data
  end

  def tiny_id
    @hash_data["id"]
  end

  def title
    @hash_data["title"]
  end

  def artist
    @hash_data["artist_name"]
  end

  def youtube_id
    self.class.get_youtube_id(artist, title)
  end

  def self.get_youtube_id(artist, title)
    video_data = youtube_client.videos_by(:query => ("#{artist} #{title}"), :format => 5, :safe_search => 'strict', :restriction => 'US', :categories => [:music] )
    return_video = video_data.videos.first.video_id.split(':').last
    return_video
  end

  def self.test(artist,title)
    video_data = youtube_client.videos_by(:query => ("#{artist} #{title}"), :categories => [:music] ).videos.first.inspect
  end

  def youtube_client
    self.class.youtube_client
  end

  def self.youtube_client
    @youtube_client ||= YouTubeIt::Client.new(:dev_key => YOUTUBE_API_KEY)
  end

  def as_json(opts={})
    {:id => self.tiny_id, :name => "#{self.artist}: #{self.title}" }
  end
end