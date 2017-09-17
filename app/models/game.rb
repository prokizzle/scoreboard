class Game < ApplicationRecord
    has_many :players
    has_many :points

    def as_json(*)
        {
            id: id,
            service_id: service_id,
            start_time: start_time.to_i,
            end_time: end_time.presence.try(:to_i),
        }
    end
end
