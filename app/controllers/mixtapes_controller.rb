class MixtapesController < ApplicationController

	def index
	end

	def search
		# the query passed to TinySong can't contain spaces. 'new order' => 'neworder'
		@query = params[:query].split(" ").join("")

		# get the N first results from TinySong API 
		@limit = 20
		@key = "0af53736101aebb91f579527433c9208"
		@results = open("http://tinysong.com/s/#{@query}?format=json&limit=#{@limit}&key=#{@key}")
		
		#parsing the json to make it an array of hashes
		parser = Yajl::Parser.new
		@results = parser.parse(@results)

		respond_to do |format|
			format.js {render 'search.js.erb'}
		end	
	end

end