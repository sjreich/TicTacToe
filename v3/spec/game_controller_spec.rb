require 'spec_helper'

describe GameController do
  let(:game) {Game.new}
  let(:move_controller) { MoveController.new(game) }
  let(:game_controller) { GameController.new }
  let(:winner) { true }
  subject { game_controller }

  before(:each) do
    allow(Game).to receive(:new).and_return(game)
    allow(MoveController).to receive(:new).and_return(move_controller)
    allow(game_controller).to receive(:puts)
    allow(game_controller).to receive(:print)
    allow(game_controller).to receive(:sleep)
    allow(game_controller).to receive(:_winner) { winner }
  end

  describe '#run!' do
    before(:each) do
      allow(game_controller).to receive(:_start_up!)
      allow(game_controller).to receive(:_perform_main_cycle!)
      allow(game_controller).to receive(:_wrap_up!)
      subject.run!
    end

    it { should have_received :_start_up! }
    it { should have_received :_perform_main_cycle! }
    it { should have_received :_wrap_up! }
  end

  describe '#_perform_main_cycle!' do
    before(:each) do
      allow(move_controller).to receive(:execute!)
      allow(game).to receive(:display!)
      subject._perform_main_cycle!
    end

    specify { expect(move_controller).to have_received(:execute!) }
    specify { expect(game).to have_received(:display!) }
  end

  describe '#_wrap_up!' do
    before(:each) do
      subject._wrap_up!
    end

    it { should have_received(:print).with("It's over. ")}

    [:X, :O].each do |sym|
      context "the winner is #{sym}" do
        let(:winner) { sym }
        it { should have_received(:puts).with("#{sym}'s win.")}
      end
    end

    context "tie game" do
      let(:winner) { true }
      it { should have_received(:puts).with("It's a tie.")}
    end
  end
end