require_relative '../autoloader'

class MenuController
  attr_accessor :game_controller

  ACCEPTABLE_CHOICES = [:s, :r, :q].freeze

  def initialize
    @game_controller = GameController.new
  end

  def execute
    loop do
      print menu_content
      act_on(menu_selection)
      sleep 1
    end
  end

  # private

  def act_on(choice)
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
    sleep 1
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
    game_controller.run!
  end

  def menu_selection
    loop do
      selection = gets.chomp.downcase.to_sym
      print "\n"
      return selection if ACCEPTABLE_CHOICES.include? selection
      puts "That wasn't one of the options."
      print menu_content
    end 
  end

  def menu_content
"
(S)tart game
(R)eview last game
(Q)uit

Your choice: "
  end
end

MenuController.new.execute if $0 ==  __FILE__
