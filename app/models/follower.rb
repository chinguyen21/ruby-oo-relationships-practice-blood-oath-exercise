require "pry"
class Follower
  attr_reader :name, :age, :life_motto

  @@all = []
  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    self.class.all << self
  end

  def self.all
    @@all
  end

  def cults
    cults = []
    BloodOath.all.each do |bloodoath|
      if bloodoath.follower == self
        cults << bloodoath.cult
      end
    end
    cults
  end

  def join_cult(cult_instance)
    BloodOath.new(Time.now.strftime("%F"), self, cult_instance)
  end
  
  def self.of_a_certain_age(age)
    self.all.select {|follower| follower.age == age}
  end

  def my_cults_slogans
    self.cults.map {|cult| cult.slogan}
  end

  def self.most_active
    self.all.max_by {|follower| follower.cults.length}
  end

  def self.top_ten
    hash = Hash.new(0)
    self.all.each {|follower| hash[follower] = follower.cults.length}
    ten_follower = hash.sort_by {|follower,count| count}.last(10)
    ten_follower.map {|array| array[0]}
  end

end