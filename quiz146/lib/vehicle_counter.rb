class VehicleCounter
  def count_total_vehicles(input_file)
    counter = 0
    already_read_a_line = false
    skip_lines = 0

    until input_file.eof
      current_line = input_file.readline

      we_want_to_process_the_line = already_read_a_line && skip_lines == 0
      if we_want_to_process_the_line
        north_or_south_bound = current_line.chr
        case north_or_south_bound
          when 'A'
            counter = counter + 1
            already_read_a_line = false
          when 'B'
            counter = counter + 1
            skip_lines = 2
        end
      else
        already_read_a_line = true
        skip_lines -= 1 if skip_lines > 0
      end
    end

    counter
  end
end