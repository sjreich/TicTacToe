require_relative '../models/game'
require_relative '../models/move'
require_relative '../views/board'
require_relative '../models/menu'

class Controller
  attr_accessor :game, :board

  def execute
    loop do
      Menu.display
      act_on_menu_choice(Menu.get_selection)
      sleep 1
    end
  end

  def act_on_menu_choice(choice)
    sleep 1
    case choice
    when :s
      run_game
    when :r
      display_move_list
    when :q
      quit
    end
  end

  def quit
    puts "Quitting..."
    print "\n"
    sleep 2
    exit
  end

  def display_move_list
    if game
      puts "\tX\t|\tO\t"
      puts "----------------+-----------------"
      game.move_list.each_slice(2) do |pair|
        x1 = pair[0].loc[:x] + 1
        y1 = pair[0].loc[:y] + 1
        print "\t#{x1}, #{y1}\t|"
        if pair[1]
          x2 = pair[1].loc[:x] + 1
          y2 = pair[1].loc[:y] + 1
          print "\t#{x2}, #{y2}"
        end
        print "\n"
      end
    else
      puts "No last game to review."
    end
  end

  def run_game
    @game = Game.new
    @board = Board.new(game)
    board.draw
    while !game.winner? do
      new_move
    end
    sleep 1
    print "It's over. "
    if game.winner? == "X" || game.winner? == "O"
      puts "#{game.winner?}'s win."
    else
      puts "It's a tie.  How dull..."
    end
  end

  def new_move
    input = get_input
    until game.valid_move?(input) do 
      input = get_input
    end
    move = Move.new(input)
    game.register(move)
    board.update
  end

  def get_input
    print "row (1-3): "
    x = gets.chomp.to_i - 1
    print "column (1-3): "
    y = gets.chomp.to_i - 1
    {x: x, y: y}
  end
end

if __FILE__ == 'controllers/controller.rb'
  Controller.new.execute
end

