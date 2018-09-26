require"pry"

puts "GYM CODING CHALLENGE "


class Client

  @@all=[]

  attr_accessor :name, :assigned_trainer


  def initialize(name)
    @name=name
    @@all << self
  end

  def remove_trainer
    #function to remove trainer, used by other functions
    Trainer.all.each do |trainer|
      trainer.clients.delete(self)
    end
  end

  def assign_trainer(trainer_instance)
    #removes current trainer and assigns new one
    self.remove_trainer if self.trainer!="unassigned"
    trainer_instance.add_client(self)
  end

  def self.all
    @@all
  end

  def trainer
    #shows the client's current trainer
    Trainer.all.each do |trainer|
      trainer.clients.each do |client|
      if client  == self
        return trainer
      end
    end
    end
    "unassigned"
  end


  def location
    #shows the client's possible locations, since the trainers can be in multiple places, therefore clients can have those locations, too
    if self.trainer.location!="unassigned"
      self.trainer.location
    else
      "unassigned location because unassigned trainer"
    end
  end

end

p "-----------------------------------------------"


class Trainer

  @@all=[]

  attr_accessor :name, :client_count, :clients
  attr_reader :location
  def initialize(name)
    @client_count=0
    @clients =[]
    @location=[]
    @name = name
    @@all << self
  end

  def assign_client(client)
    #adds a client to the trainer's client list and
    self.add_client(client)
    #I made this method because I keep using both interchangeably
  end

  def add_client(client)
    #adds a client to the trainer's list and assigns the trainer to that client
    @clients << client
    client.assign_trainer(self)
  end

  def self.all
    @@all
  end

  def assign_location(location_instance)
    #assigns location to trainer
    location_instance=Location.new if !Location.all.include?(location_instance)
    self.location << location_instance
  end


  def assigned_clients
    #shows a list of assigned clients
    self.clients
  end


  def client_count
    #counts the aforementioned list
    @clients.length
  end

  def self.most_clients
    #finds the trainer with most clients out of @@all
    counter={}
    Trainer.all.each do |trainer|
      counter[trainer.name]=trainer.clients.count
    end
    return counter.max_by{|k,v| v}
  end

end

p "------------------------------------------------"

class Location

  @@all=[]

  attr_accessor :location_name

  def initialize(location="")
    @location_name=location
    @@all << self
  end

  def self.all
    @@all
  end

  def self.location_name
    #shows the location name
    @location_name
  end

  def self.least_clients
    #shows the location and client count, where there is the least clients
    result=Hash.new(0)
    Trainer.all.each do |trainer|
      trainer.location.each do |location|
        result[location.location_name]+=trainer.clients.count
      end
    end
    return result.min_by{|k,v| v}
  end
end




bob=Trainer.new("Bob")
angela=Trainer.new("Angela")
paul=Client.new("Paul")
pete=Client.new("Pete")
pavel=Client.new("Pavel")
steve=Client.new("Steve")
cw=Location.new("Canary Wharf")
bank=Location.new("Bank")
bob.add_client(steve)
pete.assign_trainer(bob)
bob.assign_location(cw)
bob.assign_location(bank)
angela.assign_location(cw)
pavel.assign_trainer(angela)
paul.assign_trainer(angela)
binding.pry


p "eod"
