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

  def test_converts_message_to_number
    @encryptor.convert_message_to_number
    assert_equal [20, 8, 9, 19, 9, 19, 1, 20, 5, 19, 20, 24, 24, 24, 24],
                 @encryptor.message_values
  end
end
