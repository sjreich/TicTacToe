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
    for row in 1..board_length(SQUARE_HEIGHT)
      row_output = []
      for col in 1..board_length(SQUARE_WIDTH)
        if intersection_here?(row, col)
          row_output << "+"
        elsif horizontal_here?(row)
          row_output << "-"
        elsif vertical_here?(col)
          row_output << "|"
        else
          row_output << " "
        end
      end
      pixel_array << row_output
    end
    pixel_array
  end

  private
  def pixel_string
    final_pixel_array.map(&:join).join("\n")
  end

  def add_to_pixel_array(move)
    x = pixelize(move.x, SQUARE_HEIGHT)
    y = pixelize(move.y, SQUARE_WIDTH)
    pixel_array[x][y] = move.symbol
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

  def pixelize(value, square_length)
    (value + 0.5) * square_length - 1
  end
end
