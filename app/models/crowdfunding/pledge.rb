require_relative 'project.rb'
require_relative 'user.rb'

class Pledge

  attr_accessor :project, :user, :amount

  @@pledges = []

  def initialize(project, user, amount)
    @project = project
    @user = user
    @amount = amount
    @@pledges << self
  end

  def self.all
    @@pledges
  end

end
