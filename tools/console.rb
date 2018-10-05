require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#airbnb
first_listing = Listing.new('Paris')
second_lisiting = Listing.new('London')
third_lisiting = Listing.new('London')
dan = Guest.new('Dan')
yukko = Guest.new('Yukko')
aisha = Guest.new('Aisha')
Trip1 = Trip.new(dan, second_lisiting)
Trip2 = Trip.new(yukko, first_listing)
Trip3 = Trip.new(aisha, second_lisiting)


aisha = Client.new('Aisha')
matt = Client.new('Matt')
sofia = Client.new('Sofia')

hammersmith = Location.new('Hammersmith')
manchester = Location.new('Manchester')
cambridge = Location.new('Cambridge')

muscles = Trainer.new('Mr Muscles', cambridge, aisha)
fighter = Trainer.new('Ms Fighter', hammersmith, matt)
speedy = Trainer.new('Sir Quick Pace', cambridge, sofia)



Pry.start
