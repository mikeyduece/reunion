class Reunion
  attr_reader :name, :activities

  def initialize(name=nil)
    @name       = name
    @activities = []
  end

  def add_activity(activity)
    activities.push(activity)
  end

end
