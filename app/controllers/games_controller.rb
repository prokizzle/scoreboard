class GamesController < ApplicationController
    def create
        game = Game.create(start_time: Time.current)
        game_params[:players].each do |opponent|
            player = Player.find_or_create_by({
                first_name: opponent[:first_name], 
                last_name: opponent[:last_name]
            }) 
            game.update(service_id: player.id) if opponent[:service]
            PlayerGame.create(game_id: game.id, player_id: player.id)
        end
        render json: game, status: :created
    end

    private

    def game_params
        params.require(:game).permit(:players => [:first_name, :last_name, :service])
    end
end
