require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end

  def test_it_exists
    assert_instance_of Room, @room
  end

  def test_room_can_have_category
    assert_equal :bedroom, @room.category
  end

  def test_room_has_length_and_width
    assert_equal 10, @room.length
    assert_equal 13, @rrom.width
  end

  def test_room_can_have_area
    assert_equal 130, @room.area
  end

end
