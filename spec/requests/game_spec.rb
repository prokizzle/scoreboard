require "rails_helper"

RSpec.describe "Game controller", :type => :request do

  it "creates a Game" do
    post "/games", :widget => {players: [1,2], service: 1}

    expect(JSON.parse(response.body)).to eq({game_id: 1, service: 1})
  end
end
