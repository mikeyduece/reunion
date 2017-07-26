class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name         = name
    @participants = {}
  end

  def add_participant(name, price)
    participants[name] = price
  end

  def total_cost
    participants.values.reduce(:+)
  end
end
