module Helpers
  def board_move_count
    board.final_pixel_array.join.gsub(' ', '').length
  end
end