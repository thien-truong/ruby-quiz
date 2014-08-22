class VehicleStreams
  attr_reader :northbound_vehicles, :southbound_vehicles

  def initialize
    @northbound_vehicles = []
    @southbound_vehicles = []
  end

  def add_northbound_vehicle(vehicle)
    @northbound_vehicles << vehicle
  end

  def add_southbound_vehicle(vehicle)
    @southbound_vehicles << vehicle
  end

  def merge_streams(vehicle_streams)
    @northbound_vehicles.concat(vehicle_streams.northbound_vehicles)
    @southbound_vehicles.concat(vehicle_streams.southbound_vehicles)
  end
end