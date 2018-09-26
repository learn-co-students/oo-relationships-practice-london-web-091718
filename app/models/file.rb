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
    Trainer.all.each do |trainer|
      trainer.clients.delete(self)
    end
  end

  def assign_trainer(trainer_instance)
    self.remove_trainer if self.trainer!="unassigned"
    trainer_instance.add_client(self)
  end

  def self.all
    @@all
  end

  def trainer
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
    self.add_client(client)
    #I made this method because I keep using both interchangeably
  end

  def add_client(client)
    @clients << client
  end

  def self.all
    @@all
  end

  def assign_location(location_instance)
    location_instance=Location.new if !Location.all.include?(location_instance)
    self.location << location_instance
  end


  def assigned_clients
    self.clients
  end


  def client_count
    @clients.length
  end

  def self.most_clients
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
    @location_name
  end

  def self.least_clients
    result=Hash.new(0)
    Trainer.all.each do |trainer|
      trainer.location.each do |location|
        result[location.location_name]+=trainer.clients.count
      end
    end
    return result.max_by{|k,v| v}
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
