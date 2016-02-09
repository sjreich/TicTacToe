class GameController
  attr_reader :game, :move_controller

  def initialize
  end

  def run!
    start_up!
    main_cycle!
    wrap_up!
  end

  def startup!
    puts "Let's play Tic Tac Toe!"
    @game = Game.new
    @move_controller = MoveController.new(game)
  end

  def perform_main_cycle!
    loop do
      game.display!
      move_controller.execute!
      break if winner?
    end
  end

  def wrap_up!
    sleep 0.5
    print "It's over. "
    if winner? == :X || winner? == :O
      puts "#{winner?}'s win."
    else
      puts "It's a tie."
    end
  end
end