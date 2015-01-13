require_relative 'parser'
require_relative 'vehicle_streams'
require_relative 'vehicle'
require_relative 'period'

class VehicleCounter
  def count_northbound_vehicles(vehicle_stream, interval)
    max_milliseconds = interval
    current_day = 1
    output_array = []
    vehicle_count = 0

    vehicle_stream.northbound_vehicles.each do |vehicle|

      if vehicle.end_time >= max_milliseconds
        period = Period.new(current_day, max_milliseconds - interval, max_milliseconds, vehicle_count)
        max_milliseconds = max_milliseconds + interval
        output_array << period
        vehicle_count = 0
      end

      if vehicle.day_recorded != current_day
        period = Period.new(current_day, max_milliseconds - interval, max_milliseconds, vehicle_count)
        current_day = vehicle.day_recorded
        max_milliseconds = interval
        output_array << period
        vehicle_count = 0
      end

      vehicle_count = vehicle_count + 1

    end

    period = Period.new(current_day, max_milliseconds - interval, max_milliseconds, vehicle_count)
    output_array << period
    output_array
  end
end