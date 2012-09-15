class Card
  @@alphabetical = Hash[(1..52).zip(('A'..'Z').to_a +
                                    ('A'..'Z').to_a)]

  def initialize(value)
    @value = value
  end

  def to_s
    @@alphabetical[@value]
  end
end
