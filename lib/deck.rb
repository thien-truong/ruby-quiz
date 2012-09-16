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
end
