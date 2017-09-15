class Service < ApplicationRecord
  belongs_to :game
  has_one :player
end
