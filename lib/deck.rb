require_relative "card"

class Deck
  def initialize(order)
    @cards = []
    order.each { |card_value| @cards << Card.new(card_value) }
  end

  def move_down!(card_value, amount=1)
    deck_size = @cards.length
    while amount >= deck_size - 1
      amount -= deck_size - 1
    end
    card_index = @cards.index { |card| card.value == card_value }
    card = @cards.delete_at(card_index)
    if card_index + amount >= deck_size
      card_index -= deck_size - 1
    end
    @cards.insert(card_index + amount, card)
  end

  def order
    @cards.map { |card| card.value }
  end
end
