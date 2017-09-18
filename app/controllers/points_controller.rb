class PointsController < ApplicationController
    def create
        point = Point.create!(points_params)
        render json: point, status: :created
    end

    private
    
    def points_params
        params.require(:point).permit(:game_id, :player_id)
    end
end
