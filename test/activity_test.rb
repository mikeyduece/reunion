require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  attr_reader :activity

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_its_a_thing
    assert_instance_of Activity, activity
  end

  def test_it_knows_its_activity_name
    assert_equal "Brunch", activity.name
  end

  def test_it_starts_with_an_empty_hash_of_participants
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_participants
    activity.add_participant("Jim", 20)
    expected = {"Jim" => 20}
    assert_equal expected, activity.participants
  end
end
