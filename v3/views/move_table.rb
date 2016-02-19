class MoveTable
  attr_reader :move_list

  def initialize(move_list)
    @move_list = move_list
  end

  def draw!
    puts _move_list_content
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
end