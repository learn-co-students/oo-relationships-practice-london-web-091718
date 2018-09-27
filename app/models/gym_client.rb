class Client
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def assign_trainer(new_trainer)
    new_trainer.clients << self
    if new_trainer.clients.include?(self)
      new_trainer
    end
  end

end
