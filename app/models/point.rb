class Point < ApplicationRecord
  belongs_to :player
  belongs_to :game

  def as_json(*)
      {
          point_id: id,
          player_id: player_id,
          scored_at: created_at.to_i
      }
  end
end
