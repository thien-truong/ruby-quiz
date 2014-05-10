require "test/unit"
require_relative "../lib/encryptor"
require_relative "../lib/deck"

class TestEncryptor < Test::Unit::TestCase
  def setup
    @message = "This is a test."
    @deck = Deck.new(Array((1..54)))
    @encryptor = Encryptor.new(@message, @deck)
  end

  def test_prepares_message
    message = @encryptor.send(:prepare_message)
    assert_equal("THISI SATES TXXXX", message)
  end

  def test_generates_keystream
    @encryptor.send(:prepare_message)
    keystream = @encryptor.send(:generate_keystream)
    assert_equal("DWJXH YRFDG TMSHP", keystream)
  end

  def test_converts_message_to_number
    @encryptor.send(:prepare_message)
    message_values = @encryptor.send(:convert_message_to_number)
    assert_equal [20, 8, 9, 19, 9, 19, 1, 20, 5, 19, 20, 24, 24, 24, 24],
                 message_values
  end

  def test_converts_keystream_to_number
    @encryptor.send(:prepare_message)
    @encryptor.send(:generate_keystream)
    keystream_values = @encryptor.send(:convert_keystream_to_number)
    assert_equal [4, 23, 10, 24, 8, 25, 18, 6, 4, 7, 20, 13, 19, 8, 16],
                 keystream_values
  end

  def test_adds_message_and_keystream_values_with_max_26
    @encryptor.send(:prepare_message)
    @encryptor.send(:generate_keystream)
    @encryptor.send(:convert_message_to_number)
    @encryptor.send(:convert_keystream_to_number)
    assert_equal [24, 5, 19, 17, 17, 18, 19, 26, 9, 26, 14, 11, 17, 6, 14],
                 @encryptor.send(:add_message_and_keystream_values)
  end

  def test_converts_numbers_to_letters
    @encryptor.send(:prepare_message)
    @encryptor.send(:generate_keystream)
    @encryptor.send(:convert_message_to_number)
    @encryptor.send(:convert_keystream_to_number)
    @encryptor.send(:add_message_and_keystream_values)
    message = @encryptor.send(:convert_numbers_to_letters)
    assert_equal "XESQQ RSZIZ NKQFN", message
  end

  def test_encrypts_message
    assert_equal "XESQQ RSZIZ NKQFN", @encryptor.encrypt_message
  end
end
