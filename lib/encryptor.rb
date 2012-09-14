class Encryptor
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def prepare_message
    @message.gsub! /[^a-zA-Z]/, ''
    @message.upcase!
    character_count = 1
    new_message = ""
    @message.each_char do |character|
      new_message << character
      if character_count % 5 == 0
        new_message << ' '
      end
      character_count += 1
    end
    (5 - @message.length % 5).times do
      new_message << 'X' 
    end
    @message = new_message
  end
end
