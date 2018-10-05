# create files for your ruby classes in this directory
class Trainer

  attr_accessor :clients, :locations, :name, :bonus

  @@all = []

  def initialize(name, locations=nil, clients=nil, bonus = 0)
    @clients = clients
    @locations = locations

    @@all << self
  end

  def self.all
    @@all
  end

  def find_clients

  end

  def self.most_clients

  end


end

class Client

  attr_accessor :trainer, :name

  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def find_trainers
    Trainer.all.select {|trainer| trainer.clients.include?(self)}
  end

  def find_locations
    find_location.map {|location| location.client == self}
  end


  def assign_trainer(trainer)
    self.trainer = trainer
  end

end


class Location

  attr_accessor :trainer, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def find_trainers
    Trainer.all.select { |trainer| trainer.locations}
  end

  def find_clients
    find_trainers.map {|trainer| trainer.clients}
  end

  def client_count
    find_client.count
  end

  def self.least_clients
    Location.all.min_by {|location| location.client_count}
  end

end
