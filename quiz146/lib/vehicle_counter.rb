class VehicleCounter
  def count_total_vehicles(input_file)
    counter = 0
    skip_lines = 1

    input_file.each_line do |current_line|
      if skip_lines == 0
        skip_lines = determine_lines_to_skip(current_line)
        counter += 1
      else
        skip_lines -= 1 if skip_lines > 0
      end
    end

    counter
  end

  private

  def determine_lines_to_skip(current_line)
    directional_sensor = current_line.chr
    car_is_going_north = directional_sensor == 'A'
    car_is_going_south = directional_sensor == 'B'
    if car_is_going_north
      skip_lines = 1
    elsif car_is_going_south
      skip_lines = 2
    else
      raise 'Encountered invalid sensor name. Expected A or B.'
    end
    skip_lines
  end
end