require "rails_helper"

RSpec.describe "Games API", :type => :request do

    describe 'POST /games' do
        let (:time) { Time.current }
        let (:game_attributes) do
            { 
                game: { 
                    players: [
                        {first_name: 'Barney', last_name: 'Stinson', service: true},
                        {first_name: 'Robin', last_name: 'Sherbatzky', service: false}
                    ],
                    start_time: time
                }
            }
        end
        context 'create a valid game' do
            before { post '/games', params: game_attributes }

            it 'returns a valid game' do
                json = JSON.parse(response.body)
                expect(json).to eq({id: 1, start_time: time, end_time: nil, service_id: 1})
            end
        end
    end
end
