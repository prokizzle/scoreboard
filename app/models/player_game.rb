class PlayerGame < ApplicationRecord
  belongs_to :player
  has_many :points
  belongs_to :game
end
