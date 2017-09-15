require "rails_helper"

RSpec.describe "Game controller", :type => :request do

  it "creates a Game" do
    players = [
        {first_name: 'Barney', last_name: 'Stinson', service: true},
        {first_name: 'Robin', last_name: 'Sherbatzky', service: false}
    ]
    post "/games", :game => {players: players, service: players.detect { |player| player.service } }

    expect(JSON.parse(response.body)).to eq({game_id: 1})
  end
end
