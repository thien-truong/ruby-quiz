require "test/unit"
require_relative "../lib/deck"

class TestDeck < Test::Unit::TestCase
  def setup
    @deck = Deck.new(Array((1..54)))
  end

  def test_has_order
    assert_equal(Array((1..54)), @deck.order)
  end

  def test_moves_joker_down_once
    @deck.move_down!(53)
    assert_equal(Array((1..52)) << 54 << 53, @deck.order)
  end

  def test_moves_last_card_down_once
    @deck.move_down!(54)
    assert_equal(Array((2..53)).unshift(1, 54), @deck.order)
  end

end
