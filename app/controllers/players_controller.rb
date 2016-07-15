class PlayersController < ApplicationController

  def players_by_seasons
  end

  def season
    @forwards = Player.where(season: params[:season], role: "Forward").order(caphit: :desc).page(params[:forward_page])
    @defencemans = Player.where(season: params[:season], role: "Defenceman").order(caphit: :desc).page(params[:defenceman_page])
    @goalkeepers= Player.where(season: params[:season], role: "Goaltender").order(caphit: :desc).page(params[:goalkeeper_page])
#    @players = Player.where(season: params[:season]).order(caphit: :desc).page(params[:player_page])
    @header = "Season 20#{params[:season].to_i-1} - 20#{params[:season]}"
  end

  private
    def player_params
      params.require(:player).permit(:forward_page, :defenceman_page, :goalkeeper_page, :season)
    end
end
