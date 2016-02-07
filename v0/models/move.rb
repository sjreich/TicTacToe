class Move
  attr_reader :symbol, :loc
  @@count = 0

  def initialize(location)
    @@count += 1
    @id = @@count
    @loc = location
    @symbol = @id.even? ? "O" : "X"
  end
end
