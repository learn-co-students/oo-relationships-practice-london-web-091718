require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# <--- AIRBNB SEED DATA--->
# list1 = Listing.new("copenhagen")
# list2 = Listing.new("london")
# molly = Guest.new("molly")
# alfie = Guest.new("alfie")
# trip1 = Trip.new(list1, molly)
# trip2 = Trip.new(list2, alfie)
# trip3 = Trip.new(list2, molly)

# <--- IMDB SEED DATA --->
# show1 = Show.new("Stranger Things")
# show2 = Show.new("The Bodyguard")
# show3 = Show.new("Boyhood")
# movie1 = Movie.new("Prisoner of Azkaban")
# movie2 = Movie.new("Boyhood")
# movie3 = Movie.new("Perks of Being a Wallflower")
# actor1 = Actor.new("Emma Watson")
# actor2 = Actor.new("Daniel Radcliffe")
# actor3 = Actor.new("Keeley Hawes")
# actor4 = Actor.new("Amalie Smidth")
# char1 = Character.new("Hermione", show=nil, movie1, actor1)
# char2 = Character.new("Sam", show=nil, movie3, actor1)
# char3 = Character.new("AMAZ", show1, movie=nil, actor4)
# char4 = Character.new("AMAZ", show=nil, movie3, actor4)

# <--- GYM SEED DATA --->
# amalie = Client.new("Amalie")
# barney = Client.new("Barney")
# adrian = Client.new("Adrian")
# john = Client.new("John")
# finsbury = Location.new("Gym Finsbury Square")
# teds = Location.new("Tedders Pumphouse")
# aldgate = Location.new("Thunder Thighs")
# wloo = Location.new("Waterloo")
# ryan = Trainer.new("Trainer Ryan")
# sang = Trainer.new("Trainer Sang")
# akmal = Trainer.new("Trainer Akmal")
# ryan.add_clients([amalie, barney, adrian])
# sang.add_client(barney)
# sang.add_client(john)
# ryan.add_locations([finsbury, aldgate, teds])
# akmal.add_location(wloo)
# sang.add_location(aldgate)

# <--- CROWDFUNDING SEED DATA --->
daniel = User.new('Daniel')
nkosi = User.new('Nkosi')
drone_food_delivery = Project.new('DFD', nkosi)
cuber = Project.new('Uber 4 Cats', daniel)
juicer = Project.new('JUICERWOO', daniel)
drone_food_delivery_pledge_dan = Pledge.new(drone_food_delivery, daniel, 500)
drone_food_delivery_pledge_nkosi = Pledge.new(drone_food_delivery, nkosi, 500)
cuber_pledge_dan = Pledge.new(cuber, daniel, 1034320)
cuber_pledge_dan = Pledge.new(cuber, daniel, 1053)
cuber_pledge_dan = Pledge.new(cuber, daniel, 10)
cuber_pledge_dan = Pledge.new(cuber, daniel, 44)

Pry.start
