class Search
  def initialize(query)
    @query = query.gsub(" ", "%20")
    @key = "0af53736101aebb91f579527433c9208"
  end

  def search_results
    JSON.parse(RestClient.get"http://tinysong.com/s/#{@query}?format=json&limit=#{@limit}&key=#{@key}")
  end

  def all_songs
    songs = []
    search_results.each do |song|
      songs << Result.new(song)
    end
    songs
  end
end

class Result
  def initialize(hash_data)
    @hash_data = hash_data
    @yt_player = YouTubeIt::Client.new(:dev_key => "AI39si6i1YvfcT64qFK06lhB9oT_4NuGkRnSHmyrH7XmFkOx6jtLimBtDl-NOX7-RSqqcBKH-RpuJHae3Xo6ulUT8paIk9Nh1w")
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
    video_data = @yt_player.videos_by(:query => (artist + " " + title), :categories => [:music])
    video_data.videos[0].video_id.split(':')[-1]
  end
end


#example: Search.new("deerhunter").all_songs[4].youtube_id