require 'tictactoe/game'
require 'tictactoe/board'
require 'tictactoe/player_factory'

module TicTacToeRails
  class GameAdapter
    class GameOver < RuntimeError
    end

    attr_reader :board_size, :game_mode, :display, :game, :board

    def create_game(board_size, game_mode, display)
      @board_size = board_size
      @game_mode  = game_mode
      @display    = display

      players = TicTacToe::PlayerFactory.create_pair(game_mode, @display)
      @board = TicTacToe::Board.create(board_size)
      @game = TicTacToe::Game.new(players.first, players.last, board, @display)
    end

    def play(move)
      display.move = move
      game.play_next_round

      game.round_could_be_played
    rescue TicTacToe::Game::Over
      raise GameOver.new
    end

    def restart
      create_game(@board_size, @game_mode, @display)
    end
  end
end
