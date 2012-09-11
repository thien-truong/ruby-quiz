require "test/unit"
require_relative "card"

class TestCard < Test::Unit::TestCase
  def setup
    @number = 9
    @card = Card.new
    @card.number = @number
  end

  def test_has_number
    assert_equal(@number, @card.number)
  end
end
