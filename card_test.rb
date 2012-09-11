require "test/unit"
require_relative "card"

class TestCard < Test::Unit::TestCase
  def setup
    @number = :"9"
    @suit = :hearts
    @card = Card.new
  end

  def test_has_number
    @card.number = @number
    assert_equal(@number, @card.number)
  end

  def test_has_suit
    @card.suit = @suit
    assert_equal(@suit, @card.suit)
  end
end
