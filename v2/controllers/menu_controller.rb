require_relative 'game_controller'
require_relative '../models/game'
require_relative '../models/move'
require_relative '../models/menu'
require_relative '../views/board'

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
    if old_game
      old_game.display_move_list
    else
      puts "No last game to review."
    end
  end

  def old_game
    game_controller.game
  end

  def run_game
    @game_controller = GameController.new
    @game_controller.run!
  end
end

if __FILE__ == 'controllers/menu_controller.rb'
  MenuController.new.execute
end

