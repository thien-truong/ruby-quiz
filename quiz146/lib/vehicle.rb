class Vehicle
  attr_reader :start_time, :end_time

  def initialize(start_time, end_time)
    @start_time = start_time
    @end_time = end_time
  end

  def ==(vehicle)
    @start_time == vehicle.start_time && @end_time == vehicle.end_time
  end
end