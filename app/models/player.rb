class Player < ApplicationRecord
    has_many :player_games

    validates_presence_of :first_name, :last_name
end
