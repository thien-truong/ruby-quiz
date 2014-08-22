require_relative 'vehicle_streams'

class Parser
  def initialize(input_file)
    @input_file = input_file
  end

  def generate_vehicles
    skip_lines = 1
    vehicle_streams = VehicleStreams.new
    previous_line = 0

    @input_file.each_line do |current_line|
      if skip_lines == 0
        skip_lines = determine_lines_to_skip(current_line)
        new_vehicle_streams = add_vehicle_to_stream(current_line, previous_line)
        vehicle_streams.merge_streams(new_vehicle_streams)
      else
        skip_lines -= 1 if skip_lines > 0
        previous_line = current_line.delete("A,B").to_i
      end
    end
    vehicle_streams
  end

  private

  def add_vehicle_to_stream(current_line, previous_line)
    vehicle_streams = VehicleStreams.new

    if car_is_going_north?(current_line)
      vehicle_streams.add_northbound_vehicle(Vehicle.new(previous_line))
    elsif car_is_going_south?(current_line)
      vehicle_streams.add_southbound_vehicle(Vehicle.new(previous_line))
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
      skip_lines = 1
    elsif car_is_going_south?(current_line)
      skip_lines = 3
    else
      raise 'Encountered invalid sensor name. Expected A or B.'
    end
    skip_lines
  end

end