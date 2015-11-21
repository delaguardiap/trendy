class StaticPagesController < ApplicationController
  before_action :user_logged_in?

  def home
  end

  def about
  end

  def contact
  end

  def search
    unless params[:chicken] == ""
      url = "https://maps.googleapis.com/maps/api/geocode/json?address="+params[:chicken]+"&key=Your Key"
      response = HTTParty.get(url)
      @latitude = response['results'][0]['geometry']['location']['lat']
      @longitude = response['results'][0]['geometry']['location']['lng']
      url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+@latitude.to_s+",%20"+@longitude.to_s+"&radius=5000&types=bar&key=Your Key"
      response = HTTParty.get(url)

      @bars = response['results'].map do |bar|
        Venue.find_or_create_by(name: bar['name'], address: bar['vicinity']) do |venue|
          venue.name = bar['name']
          venue.address = bar['vicinity']
          venue.rating = bar['rating']
          venue.lat = bar['geometry']['location']['lat']
          venue.lng = bar['geometry']['location']['lng']
        end
      end

      flash.now[:success] = "Success!"
    else
      flash.now[:failure] = "Search cannot be empty"
    end
    render "home"
  end

end
