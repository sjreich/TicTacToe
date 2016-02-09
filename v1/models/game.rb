class Game
  attr_accessor :move_list, :grid
  
  def initialize
    @move_list = []
    @grid = fill_in_grid
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

  def display
    Board.new(move_list).draw
  end

  def valid_move?(move)
    if out_of_bounds?(move)
      puts "That move is out of bounds"
      false
    elsif position_already_taken?(move)
      puts "That square is already full"
      false
    else
      true
    end
  end

  def valid_move?(move)
    x = move.x
    y = move.y
    @grid[x][y].nil?
  end

  def register_move(move)
    x = move[0]
    y = move[1]
    move = Move.new(x, y)
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

  def fill_in_grid
    output = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    move_list.each do |move|
      binding.pry
      output[(move.x)-1][(move.y)-1] = move.symbol
    end
    @grid = output
  end

  def tie?
    @move_list.count >= 9
  end
end