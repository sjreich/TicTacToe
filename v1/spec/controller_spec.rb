require_relative '../controllers/controller'
require 'pry'

describe MenuController do

  let(:model_game) { Game.new }
  let(:controller) { Controller.new }
  let(:board) { Board.new(model_game.move_list) }

  subject { controller }

  before(:each) do
    controller.game = model_game
    allow(controller).to receive(:gets) { %w(1 2 3).sample }
    allow(controller).to receive(:puts)
    allow(controller).to receive(:print)
    allow(model_game).to receive(:display) { board }
    allow_any_instance_of(Board).to receive(:puts)
  end
end