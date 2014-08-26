class Vehicle
  attr_reader :day_recorded, :start_time, :end_time

  def initialize(day_recorded, start_time, end_time)
    @day_recorded = day_recorded
    @start_time = start_time
    @end_time = end_time
  end

  def ==(vehicle)
    @day_recorded == vehicle.day_recorded && @start_time == vehicle.start_time && @end_time == vehicle.end_time
  end
end