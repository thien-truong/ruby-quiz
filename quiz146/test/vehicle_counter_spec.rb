require_relative '../lib/vehicle_counter'

describe VehicleCounter do
  it 'counts the total number of vehicles going Northbound - recorded with one sensor' do
    vehicle_counter = VehicleCounter.new
    StringIO.open("A98186\nA98333\nA499718\nA499886\n", 'r') do |input|
      expect(vehicle_counter.count_total_vehicles(input)).to eq(2)
    end
  end

  it 'counts the total number of vehicles going Southbound - recorded with two sensor' do
    vehicle_counter = VehicleCounter.new
    StringIO.open("A638379\nB638382\nA638520\nB638523\n", 'r') do |input|
      expect(vehicle_counter.count_total_vehicles(input)).to eq(1)
    end
  end

  it 'counts the total number of vehicles when a vehicle is interrupted at eof' do
    vehicle_counter = VehicleCounter.new
    StringIO.open("A98186\nA98333\nA499718\n", 'r') do |input|
      expect(vehicle_counter.count_total_vehicles(input)).to eq(1)
    end
  end

  it 'raises an exception when the vehicle sensor name is invalid' do
    vehicle_counter = VehicleCounter.new
    StringIO.open("A638379\nC638382\n", 'r') do |input|
      expect { vehicle_counter.count_total_vehicles(input) }.to raise_error(RuntimeError)
    end
  end

end