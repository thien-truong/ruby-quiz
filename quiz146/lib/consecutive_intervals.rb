require_relative 'interval'

class ConsecutiveIntervals
  attr_reader :consecutive_intervals

  MS_IN_24_HOURS = 86400000

  def initialize(interval_in_ms)
    intervals = []
    interval_start = 0

    while interval_start < MS_IN_24_HOURS
      interval_end = interval_start + interval_in_ms
      interval = Interval.new(interval_start, interval_end, 0)
      intervals << interval
      interval_start = interval_end
    end

    @consecutive_intervals = intervals
  end

  def accumulate_vehicles_across_intervals(periods)
    periods.each do |period|
      additional_vehicle = period.get_number_of_vehicles
      @consecutive_intervals.each do |interval|
        if interval.interval_start == period.get_interval_start
          interval.number_of_vehicles += additional_vehicle
        end
      end
    end
    @consecutive_intervals
  end

  def ==(consecutive_intervals)
    @consecutive_intervals == consecutive_intervals.consecutive_intervals
  end

end
