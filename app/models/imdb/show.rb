require_relative 'movie.rb'
require_relative 'character.rb'
require_relative 'actor.rb'

class Show

  attr_accessor :show_name

  @@SHOWS = []

  def initialize(show_name)
    @show_name = show_name
    @@SHOWS << self
  end

  def self.all
    @@SHOWS
  end

  def self.count
    @@SHOWS.count
  end

  def characters # array of all characters in a show
    Character.all.select {|character| character.show == self}
  end

  def actors  # array of all actors in a show
    characters.map {|character| character.actor}
  end

  # def self.on_the_big_screen  #return TV shows that share the same name as a movie
  #   same_name = []
  #   self.characters.each do |character|
  #     if character.movie == character.show
  #       character.movie[0][0].name == character.show[0][0].name
  #     end
  #   end
  #   same_name
  # end

  # def self.on_the_big_screen  #return TV shows that share the same name as a movie
  #   same_name = []
  #   Character.all.each do |character|
  #     if character.movie[0][0].name == character.show[0][0].name
  #       same_name << character.show
  #     end
  #   end
  #   same_name
  # end

end
