class PlayersController < ApplicationController
    def show
        player = Player.find(player_params[:id])
        render json: player, status: :ok
    end

    private

    def player_params
        params.permit(:id)
    end
end
