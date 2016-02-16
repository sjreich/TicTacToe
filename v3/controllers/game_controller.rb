class GameController
  attr_reader :game, :move_controller

  def initialize
    @game = Game.new
    @move_controller = MoveController.new(game)
  end

  def run!
    _start_up!
    _perform_main_cycle!
    _wrap_up!
  end

  def _start_up!
    puts "Let's play Tic Tac Toe!"
    game.display!
  end

  def _perform_main_cycle!
    loop do
      move_controller.execute!
      game.display!
      break if _winner
    end
  end

  def _wrap_up!
    sleep 0.5
    print "It's over. "
    if _winner == :X || _winner == :O
      puts "#{_winner}'s win."
    else
      puts "It's a tie."
    end
  end

  def _winner
    game.winner
  end
end