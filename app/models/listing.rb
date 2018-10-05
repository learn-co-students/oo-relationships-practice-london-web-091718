class Listing

  attr_accessor :city
  attr_reader :trip

  @@all = []

  ###instance methods

  def initialize(city)
    @city = city
    @@all << self
  end

  #returns an array of all trips at a listing
  def trips
    Trip.all.select { |trip| trip.listing == self}
  end

  #returns an array of all guests who have stayed at a listing
  def guests
    trips.map { |trip| trip.guest}
  end

  #returns the number of trips that have been taken to that listing
  def trip_count
    trips.count
  end

  #returns an array of all listings
  def self.all
    @@all
  end

  #takes an argument of a city name (as a string) and returns all the listings for that city
  def self.find_all_by_city(city)
    self.all.select { |listing| listing.city == city}
  end

  #finds the listing that has had the most trips
  def self.most_popular
    Listing.all.max_by { |trip| trip.trip_count}
  end
end
