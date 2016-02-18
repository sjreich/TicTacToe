class Game
  attr_accessor :move_list, :grid

  NUM_OF_ROWS = 3.freeze
  NUM_OF_COLS = 3.freeze
  
  def initialize
    @move_list = []
    _update_grid!
  end

  def display_move_list!
    puts _move_list_content
  end

  def display!
    Board.new(move_list).draw
  end

  def register(move)
    return false unless _valid?(move)
    @move_list << move
  end

  def winner
    _update_grid!
    result = false
    for i in 0..2
      result ||= _row_winner(i) || _col_winner(i)
    end
    result ||= _diag_from_upper_left_winner
    result ||= _diag_from_upper_right_winner
    result ||= _tie?
  end

  def _valid?(move)
    _in_bounds?(move) && _position_free?(move)
  end

  def _in_bounds?(move)
    in_bounds = (0...NUM_OF_ROWS).include?(move.x) && (0...NUM_OF_COLS).include?(move.y)
    puts 'That move is out of bounds.' unless in_bounds
    in_bounds
  end

  def _position_free?(move)
    _update_grid!
    x = move.x
    y = move.y
    if @grid[x][y].nil?
      true
    else
      puts 'That position is already taken.'
      false
    end
  end

  def _move_list_content
    content = _move_list_header
    move_list.each_slice(2) do |pair|
      content << _move_list_row(pair)
    end
    content.join("\n")
  end

  def _move_list_header
    [ "\tX\t|\tO\t", "----------------+-----------------" ]
  end

  def _move_list_row(pair)
    x1 = pair[0].x + 1
    y1 = pair[0].y + 1
    row = "\t#{x1}, #{y1}\t|"

    return row unless pair[1]

    x2 = pair[1].x + 1
    y2 = pair[1].y + 1
    row += "\t#{x2}, #{y2}"
    row
  end

  def _update_grid!
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    move_list.each do |move|
      x = move.x
      y = move.y
      @grid[x][y] = move.symbol
    end
  end

  def _row_winner(i)
    grid[i][2] if grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2]
  end

  def _col_winner(i)
    grid[2][i] if grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i]
  end

  def _diag_from_upper_left_winner
    grid[2][2] if grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2]
  end

  def _diag_from_upper_right_winner
    grid[2][0] if grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0]
  end

  def _tie?
    @move_list.count >= 9
  end
end