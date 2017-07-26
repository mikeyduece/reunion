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

  def test_it_can_tell_total_cost_of_activities
    reunion    = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    assert_equal 60, reunion.total_cost
  end

  def test_it_can_tell_cost_of_multiple_activities
    reunion    = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    reunion.add_activity(activity_2)

    assert_equal 200, reunion.total_cost
  end

  def test_it_can_tell_who_owes_how_much
    reunion    = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    reunion.add_activity(activity_2)

    expected = {"Jim"=> 20, "Joe"=> -10, "John"=> -10}
    assert_equal expected, reunion.breakout
  end
end
