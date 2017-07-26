require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_its_a_thing
    reunion = Reunion.new("Denver")
    assert_instance_of Reunion, reunion
  end

  def test_it_knows_the_city_name
    reunion = Reunion.new("Denver")
    assert_equal "Denver", reunion.name
  end

  def test_activities_is_empty_array_by_default
    reunion = Reunion.new("Denver")
    assert_equal [], reunion.activities
  end

  def test_it_can_add_activities
    reunion    = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    assert_equal 1, reunion.activities.count
    assert_instance_of Activity, reunion.activities[0]
  end
end
