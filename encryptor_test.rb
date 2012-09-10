require "test/unit"
require_relative "encryptor"

class TestEncryptor < Test::Unit::TestCase
  def test_has_message
    message = "This is a test."
    encryptor = Encryptor.new(message)
    assert_equal(encryptor.message, message)
  end
end
