require './lib/room'
require './lib/house'
require 'rspec'

RSpec.describe House do
  it "exists and can return attributes" do
    house = House.new("$400000", "123 sugar lane")
  expect(house).to be_a(House)
  expect(house.price).to eq("$400000")
  expect(house.address).to eq('123 sugar lane')
  expect(house.rooms).to eq([])
  end

  it 'can add rooms' do
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    expect(house.rooms).to eq([room_1, room_2])
  end

  it 'can evaluate #above_market_value'
  expect(house.above_market_value?).to eq(false)
end

  

end
