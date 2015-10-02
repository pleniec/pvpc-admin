class GameRule < ActiveRecord::Base
  belongs_to :game

  validates :game, presence: true
  validates :description, presence: true
end
