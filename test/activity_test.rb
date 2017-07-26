require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_its_a_thing
    activity = Activity.new
    assert_instance_of Activity, activity
  end

  def test_it_knows_its_activity_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_it_can_have_a_different_name
    activity = Activity.new("Party")
    assert_equal "Party", activity.name
  end

  def test_it_starts_with_an_empty_hash_of_participants
    activity = Activity.new
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new
    activity.add_participant("Jim", 20)
    expected = {"Jim" => 20}
    assert_equal expected, activity.participants
  end

  def test_it_can_tell_total_cost_of_activity
    activity = Activity.new
    activity.add_participant("Jim", 20)
    assert_equal 20, activity.total_cost
  end

  def test_it_can_add_more_participants
    activity = Activity.new
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    expected = {"Jim" => 20, "Joe" => 40}
    assert_equal expected, activity.participants
  end

  def test_it_can_tell_split_of_cost
    activity = Activity.new
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    assert_equal 60, activity.total_cost
    assert_equal 30, activity.split
  end

  def test_it_can_tell_who_owes_how_much
    activity = Activity.new
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    expected = {"Jim" => 10, "Joe" => -10}
    assert_equal expected, activity.owed
  end
end
