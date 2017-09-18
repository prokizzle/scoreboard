require 'rails_helper'

RSpec.describe 'Points API', type: :request do
    describe 'POST /points' do
        let (:points_attributes) { { point: { game_id: 1, player_id: 1 } } }
        let (:game_attributes) { { players: [{first_name: 'Peter', last_name: 'Jackson'},{first_name: 'Peter', last_name: 'Pan', service: true}] } } 

        before do 
            post '/games', params: game_attributes
            post '/points', params: points_attributes
        end

        context 'when a point is scored' do
            it 'creates a point record' do
                json = JSON.parse(response.body)
                expect(json['point_id']).to eq(1)
                expect(json['player_id']).to eq(1)
                expect(json['scored_at']).to_not be(nil)
            end
        end
    end
end
