class Move
  attr_reader :symbol, :x, :y

  ACCEPTABLE_SYMBOLS = [:X, :O].freeze

  def self.try_to_create(x, y, symbol)
    if in_bounds(x) && in_bounds(y) && acceptable_symbol(symbol)
      self.new(x, y, symbol)
    end
  end

  def initialize(x, y, symbol)
    @x = x
    @y = y
    @symbol = symbol
  end

  def self.in_bounds(loc)
    if (1..3).include? loc
      true
    else
      puts "That move is out of bounds."
      false
    end
  end

  def self.acceptable_symbol(sym)
    if ACCEPTABLE_SYMBOLS.include? sym
      true
    else
      puts "#{sym} is not an acceptable symbol."
      false
    end
  end
end
