class Game < ApplicationRecord
    has_many :player_games
    has_many :points
    belongs_to :service, foreign_key: :service_id, class_name: 'Player', optional: true

    def players
        player_games.map { |g| g.player }
    end

    def current_service
        if (points.count/2) % 2 == 0
            service
        else
            players.detect { |player| player.id != service_id }
        end
    end

    def status
        if end_time.present?
            "finished"
        else
            "ongoing"
        end
    end
    
    def score
        scores = players.map{ |player| [player.id, 0] }.to_h
        points.each do |point|
            scores[point.player_id] += 1
        end
        scores
    end

    def as_json(*)
        {
            id: id,
            current_service: current_service.as_json,
            players: players.map(&:as_json),
            game_status: status,
            score: score,
            start_time: start_time.to_i,
            end_time: end_time.presence.try(:to_i),
        }
    end
end
