require_relative "model"
require_relative "view"

class Controller
  attr_accessor :game, :board

  def execute
    loop do
      run_menu
      input = gets.chomp.upcase
      print "\n"
      sleep 1
      case input
      when "S"
        run_game
      when "R"
        display_move_list
      when "Q"
        quit
      else
        puts "That wasn't one of the options."
      end
      sleep 1
    end
  end

  def run_menu
    Menu.new.list_options
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
    game = Game.new
    board = Board.new(game)
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

if __FILE__ == 'controller.rb'
  Controller.new.execute
end

