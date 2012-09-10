require "test/unit"
require_relative "encryptor"

class TestEncryptor < Test::Unit::TestCase
  def test_has_message
    message = "This is a test."
    encryptor = Encryptor.new(message)
    assert_equal(message, encryptor.message)
  end

  def test_prepares_message
    message = "This is a test."
    encryptor = Encryptor.new(message)
    encryptor.prepare_message
    assert_equal("THISI SATES TXXXX", encryptor.message)
  end
end
