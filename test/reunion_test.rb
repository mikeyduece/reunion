require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_its_a_thing
    reunion = Reunion.new("Denver")
    assert_instance_of Reunion, reunion
  end
end
