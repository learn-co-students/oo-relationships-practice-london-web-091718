require_relative 'show.rb'
require_relative 'character.rb'
require_relative 'actor.rb'

class Movie

  attr_accessor :movie_name

  @@MOVIES = []

  def initialize(movie_name)
    @movie_name = movie_name
    @@MOVIES << self
  end

  def self.all
    @@MOVIES
  end

  def self.count
    @@MOVIES.count
  end

  def characters # array of all characters in a movie
    Character.all.select {|character| character.movie == self}
  end

  def actors   # array of all actors in a movie
    characters.map {|character| character.actor}
  end

  def self.most_actors
    counter = 0
    film_most_actors = nil
    self.all.each do |movie|
      num_of_actors = movie.actors.count
      if  num_of_actors > counter
        counter = num_of_actors
        film_most_actors = movie
      end
    end
    film_most_actors
  end

end
