require "rails_helper"

describe GameController do
  context "new" do
    it "redirects to game index" do
      thing = post :new

      expect(thing).to redirect_to "/game"
    end

    it "sets a session variable for board size" do
      post :new, { board_size: "the size" }

      expect(session[:board_size]).to eq "the size"
    end

    it "sets a session variable for game mode" do
      post :new, { game_mode: "the mode" }

      expect(session[:game_mode]).to eq "the mode"
    end
  end

  context "index" do
    it "renders the index template" do
      get :index

      expect(response).to render_template "game/index"
    end
  end
end
