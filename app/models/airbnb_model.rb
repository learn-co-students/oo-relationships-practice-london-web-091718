# require 'pry'
#
# class Listing #has many trips & a city attribute equal to the name of a city as a string
#
#   attr_accessor :city
#   @@all = []
#
#
#   def initialize (city)
#     @trips = []
#     @city = city
#     @@all << self
#   end
#
#   def new_guest (guest)
#     @guests = []
#     @guests << guest
#   end
#
#   def guests
#     @guests
#   end
#
#   def new_trip (trip)
#     @trips = []
#     @trips << trip
#   end
#
#   def trips
#     @trips
#   end
#
#   def trip_count
#     self.trips.count
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.find_all_by_city (city)
#     Listing.all.select do |listing|
#       listing.city == city
#     end
#   end
#
#
#   def self.most_popular
#     Listing.all.each do |listing|
#       x = 0
#       most_trips_listing = nil
#       if listing.trips > x
#         listing.trips = x
#         most_trips_listing = listing
#       end
#     end
#   end
#
# end
#
#
#
#
#
#
# class Guest #has many trips
#
#   attr_accessor :name
#   @@all = []
#
#
#   def initialize (name)
#     @trips = []
#     @name = name
#     @@all << self
#   end
#
#   def new_listing (listing)
#     @listings = []
#     @listings << listing
#   end
#
#   def listings
#     @listings
#   end
#
#   def new_trip (trip)
#     @trips = []
#     @trips << trip
#   end
#
#   def trips
#     @trips
#   end
#
#   def trip_count
#     self.trips.count
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.pro_traveller
#     over_one_trip = []
#     Guest.all.each do |guest|
#       if guest.trip_count > 1
#         over_one_trip << guest
#       end
#     end
#     over_one_trip
#   end
#
#   def self.find_all_by_name (name)
#       Guest.all.select do |guest|
#         guest.name == name
#     end
#   end
#
# end
#
#
#
#
#
#
#
# class Trip #belongs to a guest and a listing
#
#   attr_accessor :listing, :guest
#   @@all = []
#
#   def initialize(listing, guest)
#     @listing = listing
#     @guest = guest
#
#     guest.new_trip(self)
#     listing.new_trip(self)
#     guest.new_listing(listing)
#     listing.new_guest(guest)
#
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
# end
#
# london_place = Listing.new("London")
# # paris_place = Listing.new("Paris")
#
#
#
# barney = Guest.new("Barney")
# # tom = Guest.new("Tom")
#
#
# my_trip = Trip.new(london_place, barney)
# # my_trip2 = Trip.new(paris_place, barney)
# # toms_trip = Trip.new(london_place, tom)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# # my_listing.guests = []
# # friend_listing = Listing.new("London")
# # listing3 = Listing.new("Paris")
#
#
#
#
# binding.pry
# p 'eof'
