# We will call this code like this:

module TinySonger
  def self.search(query)
    all_songs(search_results(query))
  end

  def self.search_results(query)
    query = query.split(' ', 3).concat(query.split(' ', 2)) << query
    key = ECHONEST_API_KEY
    results = []
    query.each do |section|
      if section.length > 2
        query = CGI::escape(section)
        artists = JSON.parse(RestClient.get"http://developer.echonest.com/api/v4/song/search?api_key=#{key}&artist=#{query}&song_type=studio&results=15&song_min_hotttnesss=0.3")
        songs = JSON.parse(RestClient.get"http://developer.echonest.com/api/v4/song/search?api_key=#{key}&title=#{query}&song_type=studio&results=15&song_min_hotttnesss=0.3")
        results << songs["response"]["songs"].concat(artists["response"]["songs"])
      end
    end
    results.flatten.uniq
  end

  def self.all_songs(songs_data)
    songs_data.collect { |song| Result.new(song) }.uniq
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
    {:id => self.tiny_id, :name => "#{self.artist} #{self.title}" }
  end

end

