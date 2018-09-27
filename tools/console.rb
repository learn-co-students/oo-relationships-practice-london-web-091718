require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


# # Airbnb testing
# listing_1 = Listing.new("London")
# listing_2 = Listing.new("Paris")
# listing_3 = Listing.new("Amstardam")
# listing_4 = Listing.new("New York")
#
# guest_1 = Guest.new("Jo")
# guest_2 = Guest.new("Lee")
# guest_3 = Guest.new("Mo")
# guest_4 = Guest.new("Dee")
# guest_5 = Guest.new("Lo")
#
# trip_1 = Trip.new(listing_1, guest_1)
# trip_2 = Trip.new(listing_1, guest_1)
# trip_3 = Trip.new(listing_2, guest_2)
# trip_4 = Trip.new(listing_3, guest_3)
# trip_5 = Trip.new(listing_3, guest_2)
# trip_6 = Trip.new(listing_4, guest_1)


#Lyft app
john = Passenger.new("John")
lee = Passenger.new("Lee")
sam = Passenger.new("Sam")
deedee = Passenger.new("Deedee")
amy = Passenger.new("Amy")

driver_1 = Driver.new("Mo")
driver_2 = Driver.new("Song")
driver_3 = Driver.new("Lion")
driver_4 = Driver.new("Amanda")
driver_5 = Driver.new("Lucy")

ride_1 = Ride.new(driver_1, john, 20.50)
ride_2 = Ride.new(driver_2, john, 20.20)
ride_3 = Ride.new(driver_1, sam, 20.32)
ride_4 = Ride.new(driver_1, deedee, 20.20)
ride_5 = Ride.new(driver_3, lee, 20.30)
ride_6 = Ride.new(driver_4, lee, 20.22)
ride_7 = Ride.new(driver_5, sam, 20.0)
ride_8 = Ride.new(driver_5, lee, 20.20)




Pry.start
