class Player < ApplicationRecord
    has_many :player_games

    def as_json(*)
        {
            id: id,
            first_name: first_name,
            last_name: last_name
        }
    end
    validates_presence_of :first_name, :last_name
end
