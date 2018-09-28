require_relative 'show.rb'
require_relative 'character.rb'
require_relative 'movie.rb'

class Actor

  attr_accessor :actor_name

  @@ACTORS = []

  def initialize(actor_name)
    @actor_name = actor_name
    @@ACTORS << self
  end

  def self.all
    @@ACTORS
  end

  def self.count
    @@ACTORS.count  
  end

  def characters # array of all characters an actor has played
    Character.all.select {|character| character.actor == self}
  end

  def movies   # array of all movies an actor has been in
    characters.map {|character| character.movie}
  end

  def self.most_characters #should return which actor has played the most different characters
    counter = 0
    actor_most_char = nil
    self.all.each do |actor|
      num_of_char = actor.characters.count
      if num_of_char > counter
        counter = num_of_char
        actor_most_char = actor
      end
    end
    actor_most_char
  end

end
