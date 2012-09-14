require "test/unit"
require_relative "../lib/card"

class TestCard < Test::Unit::TestCase
  def setup
    @number = :"9"
    @suit = :hearts
    @card = Card.new @number, @suit
  end
end
