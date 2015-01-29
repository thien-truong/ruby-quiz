require_relative '../lib/vehicle_counter'
require_relative '../lib/vehicle_streams'
require_relative '../lib/vehicle'
require_relative '../lib/period'
require_relative '../lib/interval'
require_relative '../lib/consecutive_intervals'

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


    @periods = Periods.new
    @periods.add_period(Period.new(1, Interval.new(0, 43200000, 5)))
    @periods.add_period(Period.new(1, Interval.new(43200000, 86400000, 1)))
    @periods.add_period(Period.new(2, Interval.new(0, 43200000, 1)))
    @periods.add_period(Period.new(2, Interval.new(43200000, 86400000, 2)))
  end

  it 'counts the number of vehicles, period by period, 12 hours each' do
    vehicle_counter = VehicleCounter.new
    milliseconds_per_12_hours = 43200000
    expect(vehicle_counter.count_vehicles(@vehicle_streams, milliseconds_per_12_hours)).to eq(@periods)
  end

  it 'calculates the averages across all the days, period by period, 12 hours each' do
    vehicle_counter = VehicleCounter.new
    milliseconds_per_12_hours = 43200000
    expected = ConsecutiveIntervals.new(milliseconds_per_12_hours)
    expected_number_of_vehicles = [6, 3]
    expected.consecutive_intervals.each_with_index do |interval, index|
      interval.number_of_vehicles = expected_number_of_vehicles[index]
    end
    expect(vehicle_counter.calculate_averages(@periods, milliseconds_per_12_hours)).to eq(expected)
  end
end