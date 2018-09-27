class Passenger
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def rides
    Ride.all.select do |ride|
      ride.passenger == self
    end
  end

  def drivers
    rides.map do |ride|
      ride.driver
    end
  end

  def total_distance
    rides.map {|r| r.distance}.inject {|sum, dis| sum + dis}
  end

  def self.premium_members
    premium_members = []
    Ride.all.each do |ride|
      if ride.passenger.total_distance > 100
        premium_members << ride.passenger
      end
    end
    premium_members.uniq
  end


end
