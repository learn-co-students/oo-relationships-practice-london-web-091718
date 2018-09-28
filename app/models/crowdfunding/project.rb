require_relative 'user.rb'
require_relative 'pledge.rb'

class Project

  attr_accessor :name, :creator

  @@projects = []

  def initialize(name, creator)
    @name = name
    @creator = creator
    @@projects << self
  end

  def self.all
    @@projects
  end

  def self.no_pledges
    all_projects = Project.all
    pledged_projects = Pledge.all.map {|project| project.project}.uniq
    all_projects - pledged_projects
  end

  def self.most_backers
  end

  def self.above_goal
  end

end
