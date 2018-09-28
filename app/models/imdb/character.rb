require_relative 'show.rb'
require_relative 'movie.rb'
require_relative 'actor.rb'

class Character

  attr_accessor :character, :show, :movie, :actor  # , :movies, :shows

  @@CHARACTERS = []

  def initialize(character, show, movie, actor)
    @character = character
    @show = show
    @movie = movie
    @actor = actor
    # @movies = []
    # @shows = []
    # @movies << movie
    # @shows << show
    @@CHARACTERS << self
  end

  def self.all
    @@CHARACTERS
  end
  #
  # def add_movie(movie)
  #   if self.movies
  #     @movies << movie
  #   end
  # end
  #
  # def add_show(show)
  #   if self.shows.empty?
  #     @shows = []
  #   end
  #   @shows << show
  # end

#BELOW IS INCOMPLETE AND BROKEN
  def self.most_appearances #should return which character of film/television appears in the most films or tv shows
    counter = 0
    popular_character = nil
    self.all.each do |character|
      if character.movies.count + character.shows.count > counter
        counter = character.movies.count + character.shows.count
        popular_character = character
      end
    end
    popular_character
  end


end
