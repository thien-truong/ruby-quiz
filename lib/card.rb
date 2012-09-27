class Card
  attr_reader :value
  @@alphabetical = Hash[(1..54).zip(('A'..'Z').to_a +
                                    ('A'..'Z').to_a << "" << "")]

  def initialize(value)
    @value = value
  end

  def to_s
    @@alphabetical[@value]
  end
end
