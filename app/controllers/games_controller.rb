class GamesController < ApplicationController
    def create
        game = Game.create
        game_params[:players].each do |opponent|
            player = Player.find_or_create_by({
                first_name: opponent[:first_name], 
                last_name: opponent[:last_namei]
            }) 
            game.service = player if opponenet[:service]
            PlayerGame.create(game_id: game.id, player_id: player.id)
        end
        render json: game, status: :created
    end

    private

    def game_params
        puts params.inspect
        params.require(:game).permit(:players)
    end
end
