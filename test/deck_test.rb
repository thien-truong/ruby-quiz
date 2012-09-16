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

  def test_moves_joker_down_twice
    @deck.move_down!(3, 2)
    assert_equal(Array((6..54)).unshift(1, 2, 4, 5, 3), @deck.order)
  end

  def test_moves_down_57_cards
    @deck.move_down!(53, 57)
    assert_equal(Array((3..52)).unshift(1, 2, 53).push(54), @deck.order)
  end
end
