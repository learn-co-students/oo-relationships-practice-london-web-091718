require_relative 'trip.rb'
require_relative 'listing.rb'

class Guest

  attr_accessor :name

  @@guests = []

  def initialize(name)
    @name = name
    @@guests << self
  end

  def self.all
    @@guests
  end

  def trips  #returns an array of all trips a guest has made
    Trip.all.select {|trip| trip.guest == self}
  end

  def listings   #returns an array of all listings a guest has stayed at
    trips.collect {|trip| trip.listing}.uniq
  end

  def trip_count  #returns the number of trips a guest has taken
    trips.count
  end

  def self.find_all_by_name(name)
    self.all.select {|guest| guest.name == name}
  end

  def self.pro_traveller  #returns an array of all guests who have made over 1 trip
    travellers = []
    self.all.each do |guest|
      if guests.trip_count > 1
        travellers << guest
      end
    end
    travellers
  end

  #ALTERNATIVE METHOD
  # def self.pro_traveller
  #   self.all.select {|guest| guest.trip_count >1}
  # end

end
