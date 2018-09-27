class Trainer
  attr_accessor :name, :locations, :clients, :bonus

  @@all = []

  def initialize(name, locations, clients, bonus)
    @name = name
    @locations = []
    @clients = []
    @@all << self
    @bonus = 0
  end

  def self.all
    @@all
  end

  def add_location(location)
    @locations << location
  end

  def add_client(client)
    @clients << client
  end

  def self.most_clients
    trainer = @@all.max_by do |trainer|
      trainer.clients.size
    end
    trainer.bonus +=20
    trainer
  end

end
