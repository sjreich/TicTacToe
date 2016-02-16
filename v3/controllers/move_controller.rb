class MoveController
  attr_reader :game
  attr_accessor :whose_turn

  ACCEPTABLE_INPUT = ['1', '2', '3']

  def initialize(game)
    @game = game
    @whose_turn = :X
  end

  def execute!
    game.register_move(_new_move)
    _alternate_turn!
  end

  def _new_move
    loop do
      x, y = *_input
      move = Move.try_to_create(x, y, whose_turn)
      return move if _valid?(move)
    end
  end

  def _alternate_turn!
    if self.whose_turn == :X
      self.whose_turn = :O
    else
      self.whose_turn = :X
    end
  end

  def _valid?(move)
    move && game.valid_move?(move)
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
      input = gets
      return input.chomp.to_i if ACCEPTABLE_INPUT.include? input
    end
  end
end
