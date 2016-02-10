class Game
  attr_accessor :move_list, :grid
  
  def initialize
    @move_list = []
    update_grid!
  end

  def display_move_list
    puts "\tX\t|\tO\t"
    puts "----------------+-----------------"
    move_list.each_slice(2) do |pair|
      x1 = pair[0].x + 1
      y1 = pair[0].y + 1
      print "\t#{x1}, #{y1}\t|"
      if pair[1]
        x2 = pair[1].x + 1
        y2 = pair[1].y + 1
        print "\t#{x2}, #{y2}"
      end
      print "\n"
    end
  end

  def display!
    Board.new(move_list).draw
  end

  def valid_move?(move)
    update_grid!
    x = move.x
    y = move.y
    @grid[x][y].nil?
  end

  def register_move(move)
    @move_list << move
  end

  def update_grid!
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    move_list.each do |move|
      x = move.x
      y = move.y
      @grid[x][y] = move.symbol
    end
  end

  def winner?
    update_grid!
    result = false
    for i in 0..2
      result ||= row_winner(i) || col_winner(i)
    end
    result ||= diag_from_upper_left_winner
    result ||= diag_from_upper_right_winner
    result ||= tie?
  end

  def row_winner(i)
    grid[i][2] if grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2]
  end

  def col_winner(i)
    grid[2][i] if grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i]
  end

  def diag_from_upper_left_winner
    grid[2][2] if grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2]
  end

  def diag_from_upper_right_winner
    grid[2][0] if grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0]
  end

  def tie?
    @move_list.count >= 9
  end
end

class OldGameStorage
  attr_accessor :games
  
  def initialize
    @games = []
  end
end