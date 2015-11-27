module StaticPagesHelper
	def getTweets venue
		tweets = venue.name.gsub(' ','%20')
    tweets = tweets.gsub(',','%2C')
    response = HTTParty.post("https://api.twitter.com/oauth2/"+ENV['twitterAPI']+":"+ENV['twitterSecret'])
    response
	end
end
