class Player < ActiveRecord::Base
  scope :forward, -> {where(role: "Forward")}
  scope :defenceman, -> {where(role: "Defenceman")}
  scope :goalkeeper, -> {where(role: "Goaltender")}
  scope :season1718, -> {where(season: "18")}
  scope :season1819, -> {where(season: "19")}
  scope :season1920, -> {where(season: "20")}
end
