class Guest

  attr_accessor :name
  attr_reader :trip

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def trips
    Trip.all.select { |trip| trip.guest = self}
  end

  def listings
    trips.map { |trip| trip.listing}
  end

  def self.all
    @all
  end

  def trip_count
    trips.count
  end

  def self.all
    @@all
  end

  def self.pro_traveller
    self.all.map do |guest|
      if guest.trip_count > 1
        guest
      end
    end

    #self.all.select {|g| g.trip_count > 1}

  end

  def self.find_all_by_name(name)
    self.all.select do |guest|
      guest.name == name
    end
  end

end
