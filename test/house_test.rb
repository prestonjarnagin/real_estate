require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
    @house.add_room(@room_1)
    @house.add_room(@room_2)

  end
  def test_it_exists
    assert_instance_of House, @house
  end

  def test_house_has_price
    assert_equal "$400000", @house.price
  end

  def test_house_has_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_house_can_have_rooms
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_hosue_can_return_rooms_by_category
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
  end

  def test_hosue_can_calculate_area
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 1900, @house.area
  end

  def test_house_can_calculate_price_per_sq_ft
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_house_can_sort_rooms_by_area
    skip
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    expected = [@room_4, @room_3, @room_2, @room_1]
    assert_equal expected, @house.rooms_sorted_by_area
  end

  def test_house_can_sort_rooms_by_category
    skip
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    expected = {bedroom: [@room_1,@room_2], living_room: [@room_3], basement: [@room_4]}
    assert_equal expected, @house.rooms_by_category
  end
end
