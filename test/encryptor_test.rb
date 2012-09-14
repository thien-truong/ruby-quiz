require "test/unit"
require_relative "../lib/encryptor"

class TestEncryptor < Test::Unit::TestCase
  def setup
    @message = "This is a test."
    @encryptor = Encryptor.new(@message)
  end

  def test_prepares_message
    @encryptor.prepare_message
    assert_equal("THISI SATES TXXXX", @encryptor.message)
  end
end
