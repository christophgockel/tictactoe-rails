require 'tictactoe/shared_examples'
require 'tictactoe/game'
require 'tictactoe-rails/game_adapter'
require 'tictactoe-rails/dummy_display'

describe TicTacToeRails::GameAdapter do
  let(:controller) { described_class.new }

  it 'creates new games based on options' do
    controller.create_game(:board_3x3, :human_human, DummyDisplay.new)
    expect(controller.game).to be_a TicTacToe::Game
  end

  it 'plays a game round' do
    controller.create_game(:board_3x3, :human_human, DummyDisplay.new)

    old_board = controller.board.rows.flatten
    controller.play(1)
    new_board = controller.board.rows.flatten

    expect(new_board).not_to eq old_board
  end

  it 'does not play a game round when no move is provided' do
    controller.create_game(:board_3x3, :human_human, DummyDisplay.new)

    old_board = controller.board.rows.flatten
    controller.play(0)
    new_board = controller.board.rows.flatten

    expect(new_board).to eq old_board
  end

  it 'can restart a running game' do
    controller.create_game(:board_3x3, :human_human, DummyDisplay.new)

    old_board = controller.board.rows.flatten
    controller.play(1)
    controller.restart
    new_board = controller.board.rows.flatten

    expect(new_board).to eq old_board
  end

  it "raises an exception when trying to play a finished game" do
    controller.create_game(:board_3x3, :human_human, DummyDisplay.new)
    let_player_one_win

    expect { controller.play(9) }.to raise_error TicTacToeRails::GameAdapter::GameOver
  end

  context 'DummyDisplay' do
    subject { DummyDisplay.new }
    it_should_behave_like 'a game io object'
  end

  def let_player_one_win
    controller.play(1)
    controller.play(4)
    controller.play(2)
    controller.play(5)
    controller.play(3)
  end
end
