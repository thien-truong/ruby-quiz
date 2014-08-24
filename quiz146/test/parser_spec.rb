require_relative '../lib/parser'
require_relative '../lib/vehicle'

describe Parser do
  it 'creates a list of northbound vehicles from the input file' do
    StringIO.open("A638379\nB638382\nA638520\nB638523\nA98186\nA98333\nA499718\nA499886\n", 'r') do |input|
      parser = Parser.new(input)
      expect(parser.generate_vehicles.northbound_vehicles).to eq([Vehicle.new(98186, 98333),
                                                                  Vehicle.new(499718, 499886)])
    end
  end

  it 'creates a list of southbound vehicles from the input file' do
    StringIO.open("A638379\nB638382\nA638520\nB638523\nA98186\nA98333\nA499718\nA499886\n", 'r') do |input|
      parser = Parser.new(input)
      expect(parser.generate_vehicles.southbound_vehicles).to eq([Vehicle.new(638379, 638520)])
    end
  end

end