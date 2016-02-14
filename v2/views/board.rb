class Board
  attr_reader :pixel_array, :move_list

  SQUARE_HEIGHT = 4.freeze
  SQUARE_WIDTH = 6.freeze

  def initialize(move_list)
    @move_list = move_list
    @pixel_array = initial_pixel_array
  end

  def draw
    puts pixel_string
  end

  def final_pixel_array
    @pixel_array = initial_pixel_array
    move_list.each do |move|
      add_to_pixel_array(move)
    end
    pixel_array
  end

  def initial_pixel_array
    pixel_array = []
    (1..board_height).each do |row|
      row_output = ''
      (1..board_width).each do |col|
        row_output += pixel(row, col)
      end
      pixel_array << row_output
    end
    pixel_array
  end

  private
  def pixel(row, col)
    case
    when intersection_here?(row, col)
      '+'
    when horizontal_here?(row)
      '-'
    when vertical_here?(col)
      '|'
    else
      ' '
    end
  end

  def pixel_string
    final_pixel_array.join("\n")
  end

  def add_to_pixel_array(move)
    x = pixel_location(move.x, SQUARE_HEIGHT)
    y = pixel_location(move.y, SQUARE_WIDTH)
    pixel_array[x][y] = move.symbol.to_s
  end

  def board_height
    board_length(SQUARE_HEIGHT)
  end

  def board_width
    board_length(SQUARE_WIDTH)
  end

  def board_length(square_length)
    3 * square_length - 1
  end

  def intersection_here?(row, col)
    row % SQUARE_HEIGHT == 0 && col % SQUARE_WIDTH == 0
  end

  def horizontal_here?(row)
    row % SQUARE_HEIGHT == 0
  end

  def vertical_here?(col)
    col % SQUARE_WIDTH == 0
  end

  def pixel_location(value, square_length)
    (value + 0.5) * square_length - 1
  end
end
