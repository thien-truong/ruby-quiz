class Card
  attr_reader :to_i
  @@alphabetical = Hash[(1..54).zip(('A'..'Z').to_a +
                                    ('A'..'Z').to_a << "" << "")]

  def initialize(value)
    @to_i = value
  end

  def to_s
    @@alphabetical[@to_i]
  end
end
