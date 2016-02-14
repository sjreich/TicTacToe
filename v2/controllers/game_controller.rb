class GameController
  attr_reader :game, :move_controller

  def initialize
    @game = Game.new
    @move_controller = MoveController.new(game)
  end

  def run!
    start_up!
    perform_main_cycle!
    wrap_up!
  end

  def start_up!
    puts "Let's play Tic Tac Toe!"
    game.display!
  end

  def perform_main_cycle!
    loop do
      move_controller.execute!
      game.display!
      break if winner
    end
  end

  def wrap_up!
    sleep 0.5
    print "It's over. "
    if winner == :X || winner == :O
      puts "#{winner}'s win."
    else
      puts "It's a tie."
    end
  end

  def winner
    game.winner?
  end
end