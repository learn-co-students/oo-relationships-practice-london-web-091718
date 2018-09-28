require_relative 'client.rb'
require_relative 'location.rb'

class Trainer

  attr_accessor :name, :clients, :locations

  @@all_trainers = []

  def initialize(name)
    @name = name
    @clients = []
    @locations = []
    @@all_trainers << self
  end

  def self.all
    @@all_trainers
  end

  def add_client(client)
    @clients << client
    return "Congrats, #{client.name} is now a client."
  end

  def add_location(location)
    @locations << location
    return "You can now work at #{location.name}."
  end

  def add_clients(clients)   # pass in an array to add multiple clients
    clients.each {|client| @clients << client}
    return "New clients - woop!"
  end

  def add_locations(locations)    #pass in an array to add add multiple locations
    locations.each {|location| @locations << location}
    return "Added locations!"
  end

  def self.most_clients
    counter = 0
    popular_trainer = nil
    self.all.each do |trainer|
      if trainer.clients.length > counter
        counter = trainer.clients.length
        popular_trainer = trainer
      end
    end
    return ["The most popular trainer is #{popular_trainer.name}!", counter, popular_trainer]
  end

end
