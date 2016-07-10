require "nokogiri"
require "open-uri"

class Importer  

  def self.call
    Player.destroy_all
    new.parse_teams
  end

  def parse_teams
    page = Nokogiri::HTML(open("http://nhlnumbers.com/"))
    page.css("a.team").each do |team_parsed|
      fork do
        team_name = team_parsed.css('img').first['alt']
        team_logo = team_parsed.css('img').first['src']
        puts "Importing  #{team_name} players" 
        parse_players(team_parsed['href'], team_name, team_logo)
      end
    end
    Process.waitall
  end

  def parse_players(src, team_name, team_logo)
    page = Nokogiri::HTML(open(src))
    page.css('tr'). each do |player_page|
      caphit = player_page.css('td.caphit')[0].text if player_page.css('td.caphit')[0]
      if caphit.to_f >= 1 && player_page.css("a.active")[0] && season = which_season_UFA(player_page)
        Player.create(name: player_page.css("a.active")[0].text,
                      role: get_role(player_page.css('a')[0].to_s),
                      caphit: caphit.to_f,
                      season: season,
                      team_name: team_name,
                      team_logo: team_logo
                      )
      end
    end
  end

  def which_season_UFA(player_page)
    season = 18
    player_page.css('td')[5, 3].each do |maybeUFA|
      if maybeUFA && maybeUFA.text.strip =="UFA"
        return season
      end
    season += 1
    end
    return false
  end

  def get_role(player_about)
    if /Defence/.match(player_about) then 'Defenceman'
    elsif /Center|Right|Left/.match(player_about) then 'Forward'
    elsif /Goaltender/.match(player_about) then 'Goaltender'
    end
  end
end