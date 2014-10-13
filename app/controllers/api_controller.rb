require 'tictactoe-rails/game_adapter'
require 'tictactoe-rails/display'

class ApiController < ApplicationController
  def new
    board_size = params["board_size"].to_sym
    game_mode  = params["game_mode"].to_sym

    @display = TicTacToeRails::Display.new
    adapter = TicTacToeRails::GameAdapter.new

    session[:game] = adapter.create_game(board_size, game_mode, @display)

    render json: json_response
  end

  def json_response
    game = session[:game]

    {
      "playable" => game.is_playable?,
      "ongoing"  => game.is_ongoing?,
      "board"    => @display.board.rows.flatten,
      "message"  => @display.status
    }
  end
end