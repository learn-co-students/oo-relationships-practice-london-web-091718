require_relative 'trainer.rb'
require_relative 'client.rb'

class Location

  attr_accessor :name

  @@all_locations = []

  def initialize(name)
    @name = name
    @@all_locations << self
  end

  def self.all
    @@all_locations
  end

  def location_trainers  # trainers at the location
    Trainer.all.select {|trainer| trainer.locations.include?(self)}
  end

  def location_clients   # clients training at location
    self.location_trainers.map {|trainer| trainer.clients}.flatten.uniq
  end

  def self.most_clients
    counter = 0
    popular = nil
    self.all.each do |location|
      if location.location_clients.count > counter
        counter = location.location_clients.count
        popular = location
      end
    end
    return ["The most popular location is #{popular.name}!", counter, popular]
  end

  def self.least_clients
    self.all.min_by{|location| location.location_clients.length}
  end

end

#ALTERNATIVE METHOD 1
# def self.least_clients
#   counter = false
#   unpopular = nil
#   self.all.each do |location|
#     if !counter
#       counter = location.location_clients.count
#     end
#     if location.location_clients.count <= counter
#       counter = location.location_clients.count
#       unpopular = location
#     end
#   end
#   return ["The most unpopular location is #{unpopular.name}!", counter, unpopular]
# end

  #ALTERNATIVE METHOD 2 USING .most_clients to set counter value.
  # def self.least_clients
  #   counter = self.most_clients[1]
  #   unpopular = nil
  #   self.all.each do |location|
  #     if location.location_clients.count <= counter
  #       counter = location.location_clients.count
  #       unpopular = location
  #     end
  #   end
  #   return ["The most unpopular location is #{unpopular.name}!", counter, unpopular]
  # end
