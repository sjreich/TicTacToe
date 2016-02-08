require_relative '../models/game'
require_relative '../models/move'
require_relative '../views/board'
require_relative '../models/menu'

class Controller
  attr_accessor :game

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
    game.run
  end
end

if __FILE__ == 'controllers/controller.rb'
  Controller.new.execute
end

