require "test/unit"
require_relative "../lib/encryptor"
require_relative "../lib/deck"

class TestEncryptor < Test::Unit::TestCase
  def setup
    @message = "This is a test."
    @deck = Deck.new(Array((1..54)))
    @encryptor = Encryptor.new(@message, @deck)
    @encryptor.prepare_message
  end

  def test_prepares_message
    assert_equal("THISI SATES TXXXX", @encryptor.message)
  end

  def test_generates_keystream
    @encryptor.generate_keystream
    assert_equal("DWJXH YRFDG TMSHP", @encryptor.keystream)
  end
end
