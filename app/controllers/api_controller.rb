require 'tictactoe-rails/game_adapter'
require 'tictactoe-rails/display'

class ApiController < ApplicationController
  def new
    board_size = params["board_size"].to_sym
    game_mode  = params["game_mode"].to_sym

    @display = TicTacToeRails::Display.new
    adapter = TicTacToeRails::GameAdapter.new

    session[:game] = adapter.create_game(board_size, game_mode, @display)

    render json: json_game_state
  end

  def play
    @display.move = params["move"].to_i
    session[:game].play_next_round

    render json: json_game_state
  end

  def json_game_state
    game = session[:game]

    {
      "playable" => game.is_playable?,
      "ongoing"  => game.is_ongoing?,
      "board"    => @display.board.rows.flatten,
      "message"  => @display.status
    }
  end
end
