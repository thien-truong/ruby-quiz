require_relative '../lib/vehicle'

describe Vehicle do
  it 'checks the equality of two vehicles' do
    expect(Vehicle.new(12345)).to eq (Vehicle.new(12345))
  end
end