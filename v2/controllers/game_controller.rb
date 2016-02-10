require_relative 'move_controller'
require_relative '../models/game'

class GameController
  attr_accessor :old_game_storage
  attr_reader :game, :move_controller

  def initialize
    @old_game_storage = OldGameStorage.new
  end

  def run!
    start_up!
    perform_main_cycle!
    wrap_up!
  end

  def start_up!
    puts "Let's play Tic Tac Toe!"
    @game = Game.new
    @move_controller = MoveController.new(game)
  end

  def perform_main_cycle!
    loop do
      game.display!
      move_controller.execute!
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
    @old_game_storage.games << @game
  end

  def winner
    game.winner?
  end
end