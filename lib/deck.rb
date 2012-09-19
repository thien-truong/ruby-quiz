require_relative "card"

class Deck
  def initialize(order)
    @cards = []
    order.each { |card_value| @cards << Card.new(card_value) }
  end

  def move_down!(card_value, amount=1)
    card_index = @cards.index { |card| card.value == card_value }
    card = @cards.delete_at(card_index)
    amount %= @cards.length
    if card_index + amount > @cards.length
      card_index -= @cards.length
    end
    @cards.insert(card_index + amount, card)
  end

  def order
    @cards.map { |card| card.value }
  end

  def triple_cut!(first_card_value, second_card_value)
    first_card_index = @cards.index do |card|
      card.value == first_card_value
    end
    second_card_index = @cards.index do |card|
      card.value == second_card_value
    end
    if first_card_index > second_card_index
      temporary_index = first_card_index
      first_card_index = second_card_index
      second_card_index = temporary_index
    end
    first_slice = @cards.slice(0...first_card_index)
    second_slice = @cards[second_card_index + 1..-1]
    middle_slice = @cards[first_card_index..second_card_index]
    @cards = second_slice + middle_slice + first_slice
  end
end
