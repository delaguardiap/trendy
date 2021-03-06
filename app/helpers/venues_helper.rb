module VenuesHelper
	def getTweets venue
		
		config = {
	    consumer_key:    ENV["twitterAPI"],
	    consumer_secret: ENV["twitterSecret"],
	  }

	  client = Twitter::REST::Client.new(config)  
	  result = client.search(venue.name, result_type: "recent").take(20)
	  result.count
	end
end
