require "pry"

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |instance| instance.owner == self }
  end

  def dogs
    Dog.all.select { |instance| instance.owner == self }
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each { |dog_instance| dog_instance.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat_instance| cat_instance.mood = "happy" }
  end

  def sell_pets
    self.cats.each { |i| i.mood = "nervous" }
    self.dogs.each { |i| i.mood = "nervous" }
    self.cats.each { |i| i.owner = nil }
    self.dogs.each { |i| i.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
