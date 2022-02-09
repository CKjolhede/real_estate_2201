require './lib/room'
require './lib/house'
require 'rspec'

RSpec.describe House do
  before(:each) do
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  it "exists and can return attributes" do
    expect(@house).to be_a(House)
    expect(@house.price).to eq("$400000")
    expect(@house.address).to eq('123 sugar lane')
    expect(@house.rooms).to eq([])
  end

  it 'can add rooms' do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    expect(@house.rooms).to eq([@room_1, @room_2])
  end

  it 'can evaluate #above_market_value' do
    expect(@house.above_market_value?).to eq(false)
  end

  it 'can sort rooms by category' do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
    expect(@house.rooms_from_category(:basement)).to eq([@room_4])
  end

  it "can calcluate area of house" do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    expect(@house.area).to eq(1900)
  end

  it "can return house details" do
    expect(@house.details).to be_a(Hash)
  end

  # it 'can calculate #price_per_square_foot' do
  #   @house.add_room(@room_1)
  #   @house.add_room(@room_2)
  #   @house.add_room(@room_3)
  #   @house.add_room(@room_4)
  #   expect(@house.price_per_square_foot).to eq(210.53)
  # end
end
