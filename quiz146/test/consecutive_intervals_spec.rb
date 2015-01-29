require_relative '../lib/consecutive_intervals'
require_relative '../lib/interval'
require_relative '../lib/period'

describe ConsecutiveIntervals do
  it 'accumulates all the vehicles that has the same interval start time and and interval end time in the periods' do
    consecutive_intervals = ConsecutiveIntervals.new(43200000)
    periods = [Period.new(1, Interval.new(0, 43200000, 5)),
               Period.new(1, Interval.new(43200000, 86400000, 1)),
               Period.new(2, Interval.new(0, 43200000, 1)),
               Period.new(2, Interval.new(43200000, 86400000, 2))]
    expect(consecutive_intervals.accumulate_vehicles_across_intervals(periods)).to eq([
        Interval.new(0, 43200000, 6),
        Interval.new(43200000, 86400000, 3)])
  end
end