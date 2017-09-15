class GameController < ApplicationController
    def create
        game = Game.create
        game_params[:players].each do |player_id|
            PlayerGame.create(game_id: game.id, player_id: player_id)
        end
        service = Service.create(game_id: game.id, player_id: game_params[:service])
        render json: {game_id: game.id, service: service.id}, status: :ok
    end

    private

    def game_params
        params.permit(:players, :service)
    end
end
