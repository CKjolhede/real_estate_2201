require './lib/room'
require 'pry'

class House
  attr_reader :price, :address, :rooms, :details, :total_area

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @details = {'price' => @price, 'address' => @address}
    @total_area = 0
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_value?
    @price.to_i > 500000
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.each do |room|
      @total_area += room.area
    end
    @total_area
  end

  # def price_per_square_foot
  #   require "pry"; binding.pry
  #   @price.to_f / self.area
  # end
end
