require_relative '../lib/vehicle_counter'
require_relative '../lib/vehicle_streams'
require_relative '../lib/vehicle'
require_relative '../lib/period'


describe(VehicleCounter) do
  before(:each) do
    @vehicle_streams = VehicleStreams.new
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 98186, 98333))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 499718, 499886))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 2146213, 2146349))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 2211004, 2211128))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 7051179, 7051310))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(1, 47089414, 47089557))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(2, 98186, 98333))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(2, 47089414, 47089557))
    @vehicle_streams.add_northbound_vehicle(Vehicle.new(2, 48089414, 48089557))
  end

  it 'counts the number of vehicles, period by period, 12 hours each' do
    vehicle_counter = VehicleCounter.new
    milliseconds_per_12_hours = 43200000
    expect(vehicle_counter.count_vehicles(@vehicle_streams, milliseconds_per_12_hours)).to eq([
      Period.new(1, 0, 43200000, 5),
      Period.new(1, 43200000, 86400000, 1),
      Period.new(2, 0, 43200000, 1),
      Period.new(2, 43200000, 86400000, 2)])
  end

  it 'calculates the averages across all the days, period by period, 12 hours each ' do
    vehicle_counter = VehicleCounter.new
    milliseconds_per_12_hours = 43200000
    periods = [Period.new(1, 0, 43200000, 5),
               Period.new(1, 43200000, 86400000, 1),
               Period.new(2, 0, 43200000, 1),
               Period.new(2, 43200000, 86400000, 2)]
    expect(vehicle_counter.calculate_averages(periods, milliseconds_per_12_hours)).to eq([
      Period.new(0, 0, 43200000, 6),
      Period.new(0, 43200000, 86400000, 3)])
  end



end