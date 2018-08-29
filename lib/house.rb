class House

  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    #Inject pattern?
    rooms.map do |room|
      room.area
    end.sum
  end

  def price_per_square_foot
    price = @price.delete('$').to_f
    return (price / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end.reverse
  end

  def rooms_by_category
    @rooms.group_by do |room|
      room.category
    end
  end

end
