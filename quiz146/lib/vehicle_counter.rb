require_relative 'parser'
require_relative 'vehicle_streams'
require_relative 'vehicle'
require_relative 'period'

class VehicleCounter
  def count_vehicles(vehicle_stream, interval_in_ms)
    ms_of_next_interval = interval_in_ms
    current_day = 1
    periods = []
    vehicle_count = 0

    add_period_and_reset_count_if = lambda do |condition, &block|

      if condition

        period = Period.new(
            current_day,
            ms_of_next_interval - interval_in_ms,
            ms_of_next_interval,
            vehicle_count)

        block.call

        periods << period
        vehicle_count = 0

      end
    end

    vehicle_stream.northbound_vehicles.each do |vehicle|

      vehicle_in_next_interval = vehicle.end_time >= ms_of_next_interval
      add_period_and_reset_count_if.call(vehicle_in_next_interval) do
        ms_of_next_interval += interval_in_ms
      end

      vehicle_in_next_day = vehicle.day_recorded != current_day
      add_period_and_reset_count_if.call(vehicle_in_next_day) do
        current_day = vehicle.day_recorded
        ms_of_next_interval = interval_in_ms
      end

      vehicle_count += 1
    end

    period = Period.new(
      current_day,
      ms_of_next_interval - interval_in_ms,
      ms_of_next_interval,
      vehicle_count)
    periods << period

    periods
  end

  def calculate_averages(periods, interval_in_ms)
    averages_period_by_period = []
    interval_start = 0

    while interval_start < 86400000
      interval_end = interval_start + interval_in_ms
      period = Period.new(0, interval_start, interval_end, 0)
      averages_period_by_period << period
      interval_start = interval_end
    end

    periods.each do |period|
      additional_vehicle = period.number_of_vehicles
      averages_period_by_period.each do |averages_period|
        if averages_period.interval_start == period.interval_start
          averages_period.number_of_vehicles += additional_vehicle
        end
      end
    end

    averages_period_by_period
  end
end