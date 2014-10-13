class DummyDisplay
  attr_reader :move, :board, :status
  attr_accessor :game_is_playable, :game_is_ongoing, :board

  def show_board(board)
    @board = board
  end

  def announce_next_player(mark)
    @status = "next player"
  end

  def show_invalid_move_message
    @status = "invalid move"
  end

  def announce_winner(mark)
    @status = "winner"
  end

  def announce_draw
    @status = "draw"
  end

  def can_provide_next_move?
    true
  end

  def next_move
    @move
  end

  def move=(move)
    @move = move
  end

  def the_binding
    binding
  end
end
