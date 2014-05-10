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

  def test_performs_triple_cut_with_reversed_arguments
    @deck.triple_cut!(52, 3)
    assert_equal(Array((3..52)).unshift(53, 54).push(1, 2), @deck.order)
  end

  def test_performs_count_cut
    @deck.count_cut!(3)
    assert_equal(Array((4..53)).push(1, 2, 3, 54), @deck.order)
  end

  def test_performs_bottom_card_count_cut
    @deck = Deck.new(Array((3..54)).push(1, 2))
    @deck.bottom_card_count_cut!
    assert_equal(Array((5..54)).push(1, 3, 4, 2), @deck.order)
  end

  def test_gets_letter_after_count
    assert_equal("C", @deck.get_letter_after(2))
  end
  
  def test_gets_letter_after_deck_size_count
    @deck = Deck.new(Array((2..54)).push(1))
    assert_equal("A", @deck.get_letter_after(54))
  end

  def test_gets_letter_based_on_top_card_value
    assert_equal("B", @deck.find_output_letter)
  end
end
