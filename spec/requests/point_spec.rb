require 'rails_helper'

RSpec.describe 'Points API', type: :request do
    describe 'POST /points' do
        let (:points_attributes) { { game_id: 1, player_id: 1 } }
        before { post '/points', params: points_attributes }

        context 'when a point is scored' do
            it 'creates a point record' do
                json = JSON.parse(response.body)
                expect(json['game_id']).to eq(1)
                expect(json['player_id']).to eq(1)
                expect(json['created_at']).to != nil
            end
        end
    end
end
