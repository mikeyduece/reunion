class Reunion
  attr_reader :name, :activities

  def initialize(name=nil)
    @name       = name
    @activities = []
  end

end
