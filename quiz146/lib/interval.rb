class Interval
  attr_reader :interval_start, :interval_end
  attr_accessor :number_of_vehicles

  def initialize(interval_start, interval_end, number_of_vehicles)
    @interval_start = interval_start
    @interval_end = interval_end
    @number_of_vehicles = number_of_vehicles
  end

  def ==(interval)
    @interval_start == interval.interval_start &&
        @interval_end == interval.interval_end &&
        @number_of_vehicles == interval.number_of_vehicles
  end
end