require 'tictactoe-rails/game_adapter'
require 'tictactoe-rails/display'

class ApiController < ApplicationController
  def new
    board_size = params["board_size"].to_sym
    game_mode  = params["game_mode"].to_sym

    display = TicTacToeRails::Display.new
    adapter = TicTacToeRails::GameAdapter.new

    save_game_data({
      game: adapter.create_game(board_size, game_mode, display),
      display: display
    })

    render json: json_game_state
  end

  def play
    game_data[:display].move = current_move
    game_data[:game].play_next_round

    render json: json_game_state
  end

  def current_move
    params.fetch("move").to_i
  rescue KeyError
    nil
  end

  def json_game_state
    game    = game_data[:game]
    display = game_data[:display]

    {
      "playable" => game.is_playable?,
      "ongoing"  => game.is_ongoing?,
      "board"    => display.board.rows.flatten,
      "message"  => display.status
    }
  end

  private

  @@games = {}

  def save_game_data(data)
    @@games[session[:session_id]] = data
  end

  def game_data
    @@games[session[:session_id]]
  end
end
