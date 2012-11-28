class MixtapesController < ApplicationController

	def index
	end

	def new
		@mixtape = Mixtape.new
	end

	def search
		# the query passed to TinySong can't contain spaces. 'new order' => 'new%20order'
		@query = params[:query].gsub(" ", "%20")
		@limit = 20
		@key = "0af53736101aebb91f579527433c9208"
		@url = "http://tinysong.com/s/#{@query}?format=json&limit=#{@limit}&key=#{@key}"
		puts @url

		#parsing the json to make it an array of hashes
		@results_json = open(@url)
		parser = Yajl::Parser.new
		@results = parser.parse(@results_json)

		respond_to do |format|
			format.js {render 'search.js.erb'}
		end	
	end

	def show
	end

end