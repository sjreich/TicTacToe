class Move
  attr_reader :symbol

  def initialize(x, y, symbol)
    @x = x
    @y = y
    @symbol = symbol
  end

  def x
    @x - 1
  end

  def y
    @y - 1
  end
end
