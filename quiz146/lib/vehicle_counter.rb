require_relative 'parser'
require_relative 'vehicle_streams'
require_relative 'vehicle'
require_relative 'period'
require_relative 'interval'
require_relative 'consecutive_intervals'
require_relative 'periods'

class VehicleCounter
  def count_vehicles(vehicle_stream, interval_in_ms)
    ms_of_next_interval = interval_in_ms
    current_day = 1
    periods = Periods.new
    vehicle_count = 0

    add_period_and_reset_count_if = lambda do |condition, &block|

      if condition

        interval = Interval.new(ms_of_next_interval - interval_in_ms, ms_of_next_interval, vehicle_count)
        period = Period.new(current_day, interval)

        block.call

        periods.add_period(period)
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

    interval = Interval.new(ms_of_next_interval - interval_in_ms, ms_of_next_interval, vehicle_count)
    period = Period.new(current_day, interval)

    periods.add_period(period)

    periods
  end

  def calculate_averages(periods, interval_in_ms)


    consecutive_intervals = ConsecutiveIntervals.new(interval_in_ms)

    consecutive_intervals.accumulate_vehicles_across_intervals(periods)

    consecutive_intervals
  end
end