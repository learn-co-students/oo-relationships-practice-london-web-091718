require_relative 'project.rb'
require_relative 'pledge.rb'

class User

  attr_accessor :name

  @@users = []

  def initialize(name)
    @name = name
    @@users << self
  end

  def self.all
    @@users
  end

  def self.highest_pledge  #returns the user who has made the highest pledge
    Pledge.all.max_by {|pledge| pledge.amount}.user
  end

  def self.multi_pledgers  #returns all users who have pledged to multiple projects
    pledgers = {}
    Pledge.all.each do |pledge|
      if pledgers[pledge.user.name] == nil
        pledgers[pledge.user.name] =1
      else
        pledgers[pledge.user.name] +=1
      end
    end
    pledgers    #incomplete   need to filter
  end

  def self.project_creator  # returns all users who have created a project
    Project.all.map {|project| project.creator}.uniq
  end

end
