require "test/unit"
require_relative "../lib/deck"

class TestDeck < Test::Unit::TestCase
  def setup
    @deck = Deck.new(Array((1..54)))
  end

  def test_has_order
    assert_equal(Array((1..54)), @deck.order)
  end

  def test_moves_card_down_once
    @deck.move_down!(53)
    assert_equal(Array((1..52)) << 54 << 53, @deck.order)
  end

  def test_moves_last_card_down_once
    @deck.move_down!(54)
    assert_equal(Array((2..53)).unshift(1, 54), @deck.order)
  end

  def test_moves_second_to_last_card_down_twice
    @deck.move_down!(53, 2)
    assert_equal(Array((2..52)).unshift(1, 53).push(54), @deck.order)
  end

  def test_moves_down_107_cards_same_as_1_card
    @deck.move_down!(1, 107)
    assert_equal(Array((3..54)).unshift(2, 1), @deck.order)
  end

  def test_performs_triple_cut
    @deck.triple_cut!(3, 52)
    assert_equal(Array((3..52)).unshift(53, 54).push(1, 2), @deck.order)
  end
end
