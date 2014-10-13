require 'tictactoe/board'
require 'tictactoe/player_factory'

require 'home/index_view_model'

class HomeController < ApplicationController
  attr_reader :board_sizes, :game_modes

  def index
    view_model = IndexViewModel.new(TicTacToe::Board.available_sizes, TicTacToe::PlayerFactory.available_player_pairs)

    @board_sizes = view_model.board_sizes
    @game_modes = view_model.game_modes

    render "home/index"
  end
end
