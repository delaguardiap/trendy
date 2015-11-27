module StaticPagesHelper
	def getTweets venue
		tweets = venue.name.gsub(' ','%20')
    tweets = tweets.gsub(',','%2C')
    response = HTTParty.post("")
    response.to_json
	end
end
