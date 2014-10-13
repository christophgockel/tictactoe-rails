require "rails_helper"

describe ApiController do
  context "new" do
    it "creates a new game for the session" do
      post :new, { board_size: "board_3x3", game_mode: "human_human" }
      expect(session[:game]).not_to be_nil
    end

    it "returns a valid JSON response" do
      post :new, { board_size: "board_3x3", game_mode: "human_human" }

      expect(json(response)).to be_valid_game_json
    end

    it "returns the board's state in the JSON response" do
      post :new, { board_size: "board_3x3", game_mode: "human_human" }

      expect(json(response)["board"]).to eq(Array.new(9))
    end

    def json(response)
      ActiveSupport::JSON.decode response.body
    end
  end
end
