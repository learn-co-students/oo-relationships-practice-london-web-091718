class Location
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def trainers
    trainers = []
    Trainer.all.select do |trainer|
      trainer.locations.each do |location|
        if location == self
          trainers << trainer
        end
      end
    end
    trainers
  end

  def clients
    trainers.map do |trainer|
      trainer.clients.count
    end.inject {|sum, num| sum + num}
  end

  def self.least_clients
    @@all.min_by do |location|
      if location.clients != nil
        location.clients
      end
    end
  end

end
