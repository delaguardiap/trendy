module StaticPagesHelper
	def getTweets venue
	
	config = {
    consumer_key:    ENV["twitterAPI"],
    consumer_secret: ENV["twitterSecret"],
  }

  client = Twitter::REST::Client.new(config)  
  result = client.search(venue.name, result_type: "recent")
  result.count
  result.to_json
	end

  def getTweetsContent venue
  
  config = {
    consumer_key:    ENV["twitterAPI"],
    consumer_secret: ENV["twitterSecret"],
  }

  client = Twitter::REST::Client.new(config)  
  result = client.search(venue.name, result_type: "recent")
  end


end
