class StaticPagesController < ApplicationController
  before_action :user_logged_in?
  #  before_action :set_auth

  def home
  end

  def about
  end

  def contact
  end

  def search
    if params[:chicken] != ""
      address = params[:chicken].gsub(' ','%20')
      address = address.gsub(',','%2C')
      url = "https://maps.googleapis.com/maps/api/geocode/json?address="+address+"&key=#{ENV['googlekey']}"
      response = HTTParty.get(url)
      if response['results'][0] == nil
        flash.now[:failure] = "Please search for an area or zip code, e.g: Miami Beach, or 33139"
      else
        @latitude = response['results'][0]['geometry']['location']['lat']
        @longitude = response['results'][0]['geometry']['location']['lng']
        url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+@latitude.to_s+",%20"+@longitude.to_s+"&radius=5000&types=night_club&key=#{ENV['googlekey']}"
        response = HTTParty.get(url)
        @bars = response['results'].map do |bar|
          Venue.find_or_create_by(name: bar['name'], address: bar['vicinity']) do |venue|
            venue.name = bar['name']
            venue.address = bar['vicinity']
            venue.rating = bar['rating']
            venue.price = bar['price_level']
            venue.lat = bar['geometry']['location']['lat']
            venue.lng = bar['geometry']['location']['lng']
          end
        end
      end
    else
      flash.now[:failure] = "Search cannot be empty"
    end
    @search = params[:chicken]
    render "home"
end



  # protected

  # def auth_hash
  #   request.env['omniauth.auth']
  # end



end
