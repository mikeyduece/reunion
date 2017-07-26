class Reunion
  attr_reader :name, :activities

  def initialize(name=nil)
    @name       = name
    @activities = []
  end

  def add_activity(activity)
    activities.push(activity)
  end

  def total_cost
    sum = 0
    activities.map do |activity|
      sum += activity.total_cost
    end
    sum
  end

end
