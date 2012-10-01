class Encryptor
  attr_reader :message, :keystream, :message_values
  @@numerical = Hash[('A'..'Z').zip(1..26)]
  
  def initialize(message, deck)
    @message = message
    @deck = deck
    @keystream = ""
    @message_values = []
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

  def generate_keystream
    count = 0
    while @keystream.length < @message.length
      @deck.move_down! 53
      @deck.move_down! 54, 2
      @deck.triple_cut! 53, 54
      @deck.bottom_card_count_cut!
      @keystream << @deck.find_output_letter
      if count >= 5
        @keystream << ' '
        count = 0
      end
      count += 1
    end 
    @keystream.rstrip!
  end

  def convert_message_to_number
    @message.gsub(/ /, '').each_char do |character|
      @message_values << @@numerical[character]
    end
  end
end
