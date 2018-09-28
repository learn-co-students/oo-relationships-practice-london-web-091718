require_relative 'trip.rb'
require_relative 'guest.rb'

class Listing

  attr_accessor :city

  @@listings = []

  def initialize(city)
    @city = city
    @@listings << self
  end

  def self.all
    @@listings
  end

  def trips  #returns an array of all trips at a listing
    Trip.all.select {|trip| trip.listing == self}
  end

  def guests     #returns an array of all guests who have stayed at a listing
    trips.collect {|trip| trip.guest}.uniq
  end

  def trip_count  #returns the number of trips that have been taken to that listing
    trips.count
  end

  def self.find_all_by_city(city)
    self.all.select {|listing| listing.city == city}
  end

  def self.most_popular  #finds the listing that has had the most trips
    most_pop = nil
    counter = 0
    self.all.each do |listing|
      if listing.trip_count > counter
        counter = num_trips
        most_pop = listing
      end
    end
    most_pop
  end

  # ALTERNATIVE METHOD
  # def self.most_popular
  #   Listing.all.max_by {|listing| listing.trip_count}
  # end

end
