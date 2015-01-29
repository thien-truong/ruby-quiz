require_relative 'interval'

class Period
  attr_reader :day_recorded, :interval

  def initialize(day_recorded, interval)
    @day_recorded = day_recorded
    @interval = interval
  end

  def ==(period)
    @day_recorded == period.day_recorded &&
    @interval == period.interval
  end

  def get_number_of_vehicles
    @interval.number_of_vehicles
  end

  def get_interval_start
    @interval.interval_start
  end
end