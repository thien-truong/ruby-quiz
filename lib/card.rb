class Card
  def initialize(value)
    @value = value
  end

  def to_s
    hash = Hash[(1..26).zip(('A'..'Z'))]
    hash[@value]
  end
end
