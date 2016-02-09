require_relative '../models/game'
require_relative '../models/move'
require_relative '../views/board'
require_relative '../models/menu'

class MenuController
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
      game.display_move_list
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

