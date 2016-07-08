class Player < ActiveRecord::Base
  belongs_to :team
  scope :forward, -> {where(role: "Forward")}
  scope :defenceman, -> {where(role: "Defencemen")}
  scope :goalkeeper, -> {where(role: "Goaltender")}
  scope :season1718, -> {where(season: "18")}
  scope :season1819, -> {where(season: "19")}
  scope :season1920, -> {where(season: "20")}
end
