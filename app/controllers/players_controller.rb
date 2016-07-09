class PlayersController < ApplicationController

  def players_by_seasons
  end

  def season1718
    @forwards = Player.season1718.forward.order(caphit: :desc).page(params[:forward_page])
    @defencemans = Player.season1718.defenceman.order(caphit: :desc).page(params[:defenceman_page])
    @goalkeepers = Player.season1718.goalkeeper.order(caphit: :desc).page(params[:goalkeeper_page])
    @header = "Season 2017 - 2018"
    render "season_head"
  end

  def season1819
    @forwards = Player.season1819.forward.order(caphit: :desc).page(params[:forward_page])
    @defencemans = Player.season1819.defenceman.order(caphit: :desc).page(params[:defenceman_page])
    @goalkeepers = Player.season1819.goalkeeper.order(caphit: :desc).page(params[:goalkeeper_page])
    @header = "Season 2018 - 2019"
    render "season_head"
  end

  def season1920
    @forwards = Player.season1920.forward.order(caphit: :desc).page(params[:forward_page])
    @defencemans = Player.season1920.defenceman.order(caphit: :desc).page(params[:defenceman_page])
    @goalkeepers = Player.season1920.goalkeeper.order(caphit: :desc).page(params[:goalkeeper_page])
    @header = "Season 2019 - 2020"
    render "season_head"
  end
end
