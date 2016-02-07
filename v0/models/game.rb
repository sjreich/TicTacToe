class Game
  attr_accessor :move_list, :grid
  
  def initialize
    @move_list = []
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def register(move)
    x = move.loc[:x]
    y = move.loc[:y]
    @grid[x][y] = move.symbol

    @move_list << move
  end

  def winner?
    result = false
    for i in 0..2
      result ||= row_winner(i) || col_winner(i)
    end
    result ||= diag_from_upper_left_winner
    result ||= diag_from_upper_right_winner

    # check for tie
    # interesting project: better tie-detecting method
    result ||= @move_list.count >= 9
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

  def valid_move?(input)
    x = input[:x]
    y = input[:y]
    if out_of_bounds?(x, y)
      puts "That move is out of bounds"
      false
    elsif position_already_taken?(x, y)
      puts "That square is already full"
      false
    else
      true
    end
  end

  def position_already_taken?(x, y)
    @grid[x][y] != nil
  end

  def out_of_bounds?(x, y)
    x < 0 || x > 2 || y < 0 || y > 2
  end
end