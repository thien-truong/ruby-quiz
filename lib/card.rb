class Card
  @@alphabetical = Hash[(1..26).zip(('A'..'Z'))]

  def initialize(value)
    @value = value
  end

  def to_s
    @@alphabetical[@value]
  end
end
