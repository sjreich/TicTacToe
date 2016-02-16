require_relative '../autoloader'

class MenuController
  attr_accessor :game_controller

  ACCEPTABLE_CHOICES = [:s, :r, :q].freeze

  def initialize
    @game_controller = GameController.new
  end

  def execute!
    loop do
      _act_on(_menu_selection)
      sleep 1
    end
  end

  def _act_on(choice)
    sleep 1
    case choice
    when :s
      _run_game!
    when :r
      _display_move_list!
    when :q
      _quit!
    end
  end

  def _quit!
    puts "Quitting..."
    print "\n"
    sleep 1
    exit
  end

  def _display_move_list!
    if _old_game.move_list.empty?
      puts 'No last game to review.'
    else
      _old_game.display_move_list!
    end
  end

  def _old_game
    game_controller.game
  end

  def _run_game!
    game_controller.run!
  end

  def _menu_selection
    loop do
      print _menu_content
      selection = gets.chomp.downcase.to_sym
      print "\n"
      return selection if ACCEPTABLE_CHOICES.include? selection
      puts "That wasn't one of the options."
    end 
  end

  def _menu_content
"
(S)tart game
(R)eview last game
(Q)uit

Your choice: "
  end
end

MenuController.new.execute! if $0 ==  __FILE__
