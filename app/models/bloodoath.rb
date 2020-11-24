class BloodOath
  attr_reader :initiation_date, :follower, :cult

  @@all = []
  def initialize(initiation_date, follower, cult)
    @initiation_date = initiation_date
    @follower = follower
    @cult = cult
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    self.all.sort_by {|bloodoath| bloodoath.initiation_date}[0].follower
  end
  
end
