class Player < ApplicationRecord
    has_many :player_games

    def total_games
        player_games.count
    end

    def win_percentage
        return 0 if total_games.zero?
        player_games.where(outcome: 'win').count/total_games
    end

    def bystander_count
        last_game = player_games.last.try(:game)
        return Game.count unless last_game.present? && last_game.end_time.present?
        
        Game.where(end_time: last_game.end_time..Time.now).count
    end

    def as_json(*)
        {
            id: id,
            first_name: first_name,
            last_name: last_name,
            total_games: total_games,
            win_percentage: win_percentage,
            bystander_count: bystander_count
        }
    end
    validates_presence_of :first_name, :last_name
end
