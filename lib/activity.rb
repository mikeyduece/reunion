class Activity
  attr_reader :name, :participants, :owed

  def initialize(name=nil)
    @name         = name
    @participants = {}
    @owed         = {}
  end

  def add_participant(name, price)
    participants[name] = price
  end

  def total_cost
    participants.values.reduce(:+)
  end

  def split
    total_cost / participants.keys.count
  end
end
