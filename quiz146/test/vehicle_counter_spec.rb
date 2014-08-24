require_relative '../lib/vehicle_counter'
require_relative '../lib/parser'
require_relative '../lib/vehicle'

describe VehicleCounter do
  it 'counts the total vehicles in a stream' do
    vehicle_stream = [Vehicle.new(1234, 5678), Vehicle.new(2345, 6789)]
    vehicle_counter = VehicleCounter.new
    expect(vehicle_counter.count_vehicles(vehicle_stream)).to eq(2)
  end
end