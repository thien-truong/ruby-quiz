require_relative 'vehicle_streams'

class Parser
  def initialize(input_file)
    @input_file = input_file
  end

  def generate_vehicles
    lines_until_second_of_next_vehicle = 1
    vehicle_streams = VehicleStreams.new
    start_time = 0

    @input_file.each_line do |current_line|
      if lines_until_second_of_next_vehicle == 0
        lines_until_second_of_next_vehicle = determine_lines_to_skip(current_line)
        new_vehicle_streams = add_vehicle_to_northbound_stream(start_time, current_line)
        vehicle_streams.merge_streams(new_vehicle_streams)
      elsif lines_until_second_of_next_vehicle == 3
        lines_until_second_of_next_vehicle -= 1
        new_vehicle_streams = add_vehicle_to_southbound_stream(start_time, current_line)
        vehicle_streams.merge_streams(new_vehicle_streams)
      else
        if lines_until_second_of_next_vehicle > 0
          lines_until_second_of_next_vehicle -= 1
        end
        start_time = capture_time(current_line)
      end
    end
    vehicle_streams
  end

  private

  def capture_time(line)
    line.delete("AB").to_i
  end

  def add_vehicle_to_southbound_stream(start_time, current_line)
    vehicle_streams = VehicleStreams.new
    stop_time = capture_time(current_line)
    vehicle_streams.add_southbound_vehicle(Vehicle.new(start_time, stop_time))
    vehicle_streams
  end

  def add_vehicle_to_northbound_stream(start_time, current_line)
    vehicle_streams = VehicleStreams.new

    if car_is_going_north?(current_line)
      stop_time = capture_time(current_line)
      vehicle_streams.add_northbound_vehicle(Vehicle.new(start_time, stop_time))
    end

    vehicle_streams
  end

  def car_is_going_south?(current_line)
    directional_sensor(current_line) == 'B'
  end

  def car_is_going_north?(current_line)
    directional_sensor(current_line) == 'A'
  end

  def directional_sensor(current_line)
    current_line.chr
  end

  def determine_lines_to_skip(current_line)
    if car_is_going_north?(current_line)
      lines_until_second_of_next_vehicle = 1
    elsif car_is_going_south?(current_line)
      lines_until_second_of_next_vehicle = 3
    else
      raise 'Encountered invalid sensor name. Expected A or B.'
    end
    lines_until_second_of_next_vehicle
  end

end