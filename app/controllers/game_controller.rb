class GameController < ApplicationController
  def new
    session[:board_size] = params["board_size"]
    session[:game_mode] = params["game_mode"]

    redirect_to "/game"
  end
end
