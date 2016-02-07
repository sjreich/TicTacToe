class Game
  attr_reader :move_list, :grid
  
  def initialize
    @move_list = []
    @grid = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
  end

  def register(move)
    x = move.loc[:x]
    y = move.loc[:y]
    @grid[x][y] = move.symbol

    @move_list << move
  end

  def winner?
    result = false
    # check rows, columns for winner
    for i in 0..2
      result ||= row_winner?(i)
      result ||= col_winner?(i)
    end
    # check diagonals for winner
    result ||= (@grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] && @grid[2][2])
    result ||= (@grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0] && @grid[2][0])

    # check for tie
    # interesting project: better tie-detecting method
    result ||= @move_list.count >= 9
  end

  def row_winner?(i)
    @grid[i][0] == @grid[i][1] && @grid[i][1] == @grid[i][2] && @grid[i][2]
  end

  def col_winner?(i)
    @grid[0][i] == @grid[1][i] && @grid[1][i] == @grid[2][i] && @grid[2][i]
  end

  def valid_move?(input)
    x = input[:x]
    y = input[:y]
    if x < 0 || x > 2 || y < 0 || y > 2
      puts "That move is out of bounds"
      false
    elsif !@grid[x][y].nil?
      puts "That square is already full"
      false
    else
      true
    end
  end
end