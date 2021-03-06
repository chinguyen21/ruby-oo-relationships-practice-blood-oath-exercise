class Cult
  attr_reader :name, :location, :founding_year, :slogan
  attr_accessor :minimum_age

  @@all =[]
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = 0
    self.class.all << self
  end

  def self.all
    @@all
  end

  def recruite_follower(follower)
    if follower.age < self.minimum_age
      "Sorry. The minimum age to join our cult is #{self.minimum_age}. We're glad to have you in the future!"
    else 
      BloodOath.new(Time.now.strftime("%F"), follower, self)
    end
  end

  def bloodoaths
    BloodOath.all.select {|bloodoath| bloodoath.cult == self}
  end

  def followers
    self.bloodoaths.map {|bloodoath| bloodoath.follower}.uniq
  end

  def cult_population
    self.followers.size  
  end

  def self.find_by_name(name)
    self.all.find {|cult| cult.name == name}
  end

  def self.find_by_location(location)
    self.all.select {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
    self.all.select {|cult| cult.founding_year == year}
  end
  
  def average_age
    self.followers.sum {|follower| follower.age} / self.cult_population.to_f
  end

  def my_followers_mottos
    self.followers.map {|follower| follower.life_motto}
  end

  def self.least_popular
    self.all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location
    hash = Hash.new(0)
    self.all.each do |cult|
      hash[cult.location] += 1
    end
    hash.max_by {|k,v| v}[0]
  end


end

