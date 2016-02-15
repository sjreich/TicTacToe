require 'spec_helper'

describe GameController do
  let(:game) {Game.new}
  let(:move_controller) { MoveController.new(game) }

  before(:each) do
    allow(Game).to receive(:new) { game }
    allow(MoveController).to receive(:new) { move_controller }
  end

  # figure out how to test that display gets called after the last move
  
end