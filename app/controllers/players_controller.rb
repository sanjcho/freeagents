class PlayersController < ApplicationController

  def players_by_seasons
  end

  def season1718
    @players = Player.season1718.order(caphit: :desc)
  end

  def season1819
    @players = Player.season1819.order(caphit: :desc)
  end

  def season1920
    @players = Player.season1920.order(caphit: :desc)
  end
end
