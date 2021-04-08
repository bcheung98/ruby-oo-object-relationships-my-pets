class Owner
  # code goes here
  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species()
    "I am a human."
  end

  def self.all()
    @@all
  end

  def self.count()
    @@all.length
  end

  def self.reset_all()
    @@all.clear
  end

  def cats()
    Cat.all.filter {|cat| cat.owner == self}
  end

  def dogs()
    Dog.all.filter {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs()
    Dog.all.filter {|dog| dog.owner == self}.map {|dog| dog.mood = "happy"}
  end

  def feed_cats()
    Cat.all.filter {|cat| cat.owner == self}.map {|cat| cat.mood = "happy"}
  end

  def sell_pets()
    Cat.all.filter {|cat| cat.owner == self}.map do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
    Dog.all.filter {|dog| dog.owner == self}.map do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets()
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end