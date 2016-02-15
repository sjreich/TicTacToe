class MoveController
  attr_reader :game
  attr_accessor :whose_turn

  def initialize(game)
    @game = game
    @whose_turn = :X
  end

  def execute!
    move = nil
    until valid_move?(move) do
      x, y = input
      move = Move.try_to_create(x, y, whose_turn)
    end
    game.register_move(move)
    alternate_turn!
  end

  private
  def alternate_turn!
    if self.whose_turn == :X
      self.whose_turn = :O
    else
      self.whose_turn = :X
    end
  end

  def valid_move?(move)
    move && game.valid_move?(move)
  end

  def input
    print "row (1-3): "
    x = gets.chomp.to_i
    print "column (1-3): "
    y = gets.chomp.to_i
    [x, y]
  end
end
