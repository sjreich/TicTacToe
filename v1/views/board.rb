class Board
  attr_accessor :pixel_array, :game

  SQUARE_HEIGHT = 4.freeze
  SQUARE_WIDTH = 6.freeze

  def initialize(game)
    @game = game
    @pixel_array = set_pixel_array
  end

  def update
    set_pixel_array
    game.move_list.each do |move|
      add_to_pixel_array(move)
    end
    draw
  end

  def draw
    pixel_array.each{ |row| puts row.join }
  end

  def add_to_pixel_array(move)
    x_dim = pixelize(move.loc[:x], SQUARE_HEIGHT)
    y_dim = pixelize(move.loc[:y], SQUARE_WIDTH)
    pixel_array[x_dim][y_dim] = move.symbol
  end

  # private
  def total_length(square_length)
    3 * square_length - 1
  end

  def set_pixel_array
    output = []
    for row in 1..total_length(SQUARE_HEIGHT)
      row_output = []
      for col in 1..total_length(SQUARE_WIDTH)
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
      output << row_output
    end
    pixel_array = output
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
