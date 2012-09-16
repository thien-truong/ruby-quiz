require_relative "card"

class Deck
  def initialize(order)
    @cards = []
    order.each { |card_value| @cards << Card.new(card_value) }
  end

  def move_down!(card_value)
    card_index = @cards.index { |card| card.value == card_value }
    card = @cards.delete_at(card_index)
    @cards.insert(card_index + 1, card)
  end

  def order
    @cards.map { |card| card.value }
  end
end
