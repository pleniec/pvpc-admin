class Game < ActiveRecord::Base
  has_many :game_rules

  accepts_nested_attributes_for :game_rules

  validates :name, presence: true
end
