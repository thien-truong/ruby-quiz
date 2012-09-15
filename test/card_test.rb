require "test/unit"
require_relative "../lib/card"

class TestCard < Test::Unit::TestCase
  def test_26_maps_to_z
    card = Card.new(26)
    assert_equal("Z", card.to_s)
  end

  def test_52_maps_to_z
    card = Card.new(52)
    assert_equal("Z", card.to_s)
  end

  def test_54_maps_to_empty_string
    card = Card.new(54)
    assert_equal("", card.to_s)
  end
end
