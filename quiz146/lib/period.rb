class Period
  attr_reader :day_recorded, :interval_start, :interval_end, :number_of_vehicles
  def initialize(day_recorded, interval_start, interval_end, number_of_vehicles)
    @day_recorded = day_recorded
    @interval_start = interval_start
    @interval_end = interval_end
    @number_of_vehicles = number_of_vehicles
  end

  def ==(period)
  @day_recorded == period.day_recorded && @interval_start == period.interval_start && @interval_end == period.interval_end && @number_of_vehicles == period.number_of_vehicles
  end
end