require_relative 'trainer.rb'
require_relative 'location.rb'

class Client

  attr_accessor :name

  @@all_clients = []

  def initialize(name)
    @name = name
    @@all_clients << self
  end

  def self.all
    @@all_clients
  end

  def client_trainers
    Trainer.all.select {|trainer| trainer.clients.include?(self)}
  end

  def client_locations   #locations used by a client
    self.client_trainers.map {|trainer| trainer.locations}.flatten.uniq
  end

  def assign_trainer(name)
    Trainer.all.select do |trainer|
      if trainer == name
        trainer.add_client(self)
        return "Woohoo! #{trainer.name} is now your trainer!"
      end
    end
  end

end
