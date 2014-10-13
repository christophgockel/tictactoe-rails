module TicTacToeRails
  class Display
    attr_reader :status, :board
    attr_accessor :game_is_playable, :game_is_ready, :game_is_ongoing

    def initialize
      @moves = []
      @status = ""
      @board = nil
      @game_is_ongoing = false
      @game_is_playable = false
      @game_mode = ""
    end

    def move=(value)
      @moves[0] = value
    end

    def move
      @moves[0]
    end

    def the_binding
      binding
    end

    def show_board(board)
      @board = board
    end

    def show_invalid_move_message
      @status = "Invalid move"
    end

    def announce_next_player(mark)
      @status = "Next player: #{mark}"
    end

    def announce_winner(mark)
      @status = "Winner is: #{mark}"
    end

    def announce_draw
      @status = "Game ended in a draw."
    end

    def next_move
      @moves.pop || 0
    end

    def can_provide_next_move?
      @moves.any?
    end
  end
end
