require_relative '../lib/vehicle_counter'
require_relative '../lib/vehicle_streams'
require_relative '../lib/vehicle'


describe(VehicleCounter) do
  before(:each) do
    @vehicle_streams = VehicleStreams.new
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 98186, 98333))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 1035674, 1035821))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 47089414, 47089557))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(2, 98186, 98333))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(2, 47089414, 47089557))
  end

  it 'counts northbound vehicles per 12 hours' do
    vehicle_counter = VehicleCounter.new
    milliseconds_per_12_hours = 43200000
    expect(vehicle_counter.count_northbound_vehicles(@vehicle_streams, milliseconds_per_12_hours)).to eq([2, 1, 1, 1])
  end

end