class Move
  attr_reader :symbol, :x, :y, :id
  @@count = 0

  def initialize(x, y)
    @@count += 1
    @id = @@count
    @x = x
    @y = y
    @symbol = symbol
  end

  def symbol
    id.even? ? :O : :X
  end

  def in_bounds?
    x < 0 || x > 2 || y < 0 || y > 2
  end
end
