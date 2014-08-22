class Vehicle
  attr_reader :time_stamp

  def initialize(time_stamp)
    @time_stamp = time_stamp
  end

  def ==(vehicle)
    @time_stamp == vehicle.time_stamp
  end
end