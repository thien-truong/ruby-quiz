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

  def test_converts_keystream_to_number
    @encryptor.generate_keystream
    @encryptor.convert_keystream_to_number
    assert_equal [4, 23, 10, 24, 8, 25, 18, 6, 4, 7, 20, 13, 19, 8, 16],
                 @encryptor.keystream_values
  end

  def test_adds_message_and_keystream_values_with_max_26
    @encryptor.generate_keystream
    @encryptor.convert_message_to_number
    @encryptor.convert_keystream_to_number
    @encryptor.add_message_and_keystream_values
    assert_equal [24, 5, 19, 17, 17, 18, 19, 26, 9, 26, 14, 11, 17, 6, 14],
                 @encryptor.message_and_keystream_values
  end

  def test_converts_numbers_to_letters
    @encryptor.generate_keystream
    @encryptor.convert_message_to_number
    @encryptor.convert_keystream_to_number
    @encryptor.add_message_and_keystream_values
    @encryptor.convert_numbers_to_letters
    assert_equal "XESQQ RSZIZ NKQFN", @encryptor.message
  end
end
