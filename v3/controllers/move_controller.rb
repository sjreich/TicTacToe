class MoveController
  attr_reader :game
  attr_accessor :whose_turn

  def initialize(game)
    @game = game
    @whose_turn = :X
  end

  def execute!
    _add_new_move!
    _alternate_turn!
  end

  def _add_new_move!
    loop do
      x, y = *_input
      move = Move.new(x, y, whose_turn)
      if game.register(move)
        break
      end
    end
  end

  def _alternate_turn!
    if self.whose_turn == :X
      self.whose_turn = :O
    else
      self.whose_turn = :X
    end
  end

  def _input
    print "row (1-3): "
    x = _raw_input
    print "column (1-3): "
    y = _raw_input
    [x, y]
  end

  def _raw_input
    loop do
      input = gets.strip
      return input.to_i if /\A\d+\z/ === input
      print "That wasn't a number.  Try again: "
    end
  end
end
