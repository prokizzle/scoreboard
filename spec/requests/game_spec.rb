require "rails_helper"

RSpec.describe "Games API", :type => :request do

    describe 'POST /games' do
        let (:time) { Time.current }
        let (:game_attributes) do
            { 
                players: [
                    {first_name: 'Barney', last_name: 'Stinson', service: true},
                    {first_name: 'Robin', last_name: 'Sherbatzky', service: false}
                ],
                start_time: time
            }
        end
        context 'create a valid game' do
            before { post '/games', params: game_attributes }

            it 'returns a valid game' do
                json = JSON.parse(response.body)
                puts json.inspect
                expect(json['id']).to eq(1)
                expect(json['start_time']).to eq(time.to_i)
                expect(json['end_time']).to be(nil)
                expect(json['current_service']['id']).to eq(2)
            end
        end
    end
end
