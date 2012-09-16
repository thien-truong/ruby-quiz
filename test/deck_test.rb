require "test/unit"
require_relative "../lib/deck"

class TestDeck < Test::Unit::TestCase
  def test_has_order
    deck = Deck.new(Array((1..54)))
    assert_equal(Array((1..54)), deck.order)
  end

  def test_moves_joker_down_once
    deck = Deck.new(Array((1..54)))
    deck.move_down!(53)
    assert_equal(Array((1..52)) << 54 << 53, deck.order)
  end
end
