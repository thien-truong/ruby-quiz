class Periods
  attr_reader :periods

  def initialize
    @periods = []
  end

  def add_period(period)
    @periods << period
  end

  def ==(periods)
    @periods == periods.periods
  end

  def each(&block)
    @periods.each(&block)
  end

end