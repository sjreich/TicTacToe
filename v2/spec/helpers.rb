module Helpers
  def board_move_count
    board.final_pixel_array.flatten.count{|pixel| pixel != " " }
  end
end