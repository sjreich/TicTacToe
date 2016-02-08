class Game
  attr_accessor :move_list, :grid
  
  def initialize
    @move_list = []
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def display
    Board.new(move_list).draw
  end

  def register_move(x, y)
    move = Move.new(x, y)
    x = move.loc[:x]
    y = move.loc[:y]
    @grid[x][y] = move.symbol

    @move_list << move
  end

  def run
    display
    until winner? do
      new_move
      display
    end
    sleep 1
    print "It's over. "
    if winner? == :X || winner? == :O
      puts "#{game.winner?}'s win."
    else
      puts "It's a tie."
    end
  end

  def new_move
    input = get_input
    until valid_move?(input) do 
      input = get_input
    end
    register_move(input)
  end

  def get_input
    print "row (1-3): "
    x = gets.chomp.to_i - 1
    print "column (1-3): "
    y = gets.chomp.to_i - 1
    [x, y]
  end

  def winner?
    result = false
    for i in 0..2
      result ||= row_winner(i) || col_winner(i)
    end
    result ||= diag_from_upper_left_winner
    result ||= diag_from_upper_right_winner
    result ||= tie?
  end

  def row_winner(i)
    @grid[i][2] if @grid[i][0] == @grid[i][1] && @grid[i][1] == @grid[i][2]
  end

  def col_winner(i)
    @grid[2][i] if @grid[0][i] == @grid[1][i] && @grid[1][i] == @grid[2][i]
  end

  def diag_from_upper_left_winner
    @grid[2][2] if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
  end

  def diag_from_upper_right_winner
    @grid[2][0] if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
  end

  def tie?
    @move_list.count >= 9
  end

  def valid_move?(move)
    if !move.in_bounds?
      puts "That move is out of bounds"
      false
    elsif position_already_taken?(move)
      puts "That square is already full"
      false
    else
      true
    end
  end

  def position_already_taken?(move)
    @grid[move.x][move.y] != nil
  end
end