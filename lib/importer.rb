require "nokogiri"
require "open-uri"
require "uri/http"

class Importer  

  def make_parse
    
  end

  def parse_teams
    Team.destroy_all

    page = Nokogiri::HTML(open("http://nhlnumbers.com/"))
    page.css("a.team").each do |team_parsed|
      team = Team.new
      parse_players(team_parsed['href'], team)
      team.name = team_parsed.css('img').first['alt']
      team.image = team_parsed.css('img').first['src']
      team.save
    end
  end

  def parse_players(src, team)
    page = Nokogiri::HTML(open(src))
    #puts page.css("a.active")[0].text #player names
    page.css('tr'). each do |player_page|
      caphit = player_page.css('td.caphit')[0].text if player_page.css('td.caphit')[0]
      if caphit.to_f >= 1 && player_page.css("a.active")[0] && is_UFA?(player_page)
        player = team.players.new
        puts player.name = player_page.css("a.active")[0].text
        player.role = get_role(player_page.css('a')[0].to_s)
        player.caphit = caphit.to_f
        player.save
      end
    end
  end

  def is_UFA?(player_page)
    player_page.css('td')[5, 3].each do |maybeUFA|
      if maybeUFA && maybeUFA.text.strip =="UFA"
        return true
      end
    end
    return false
  end

  def get_role(player_about)
    if /Defence/.match(player_about) then 'Defencemen'
    elsif /Center|Right|Left/.match(player_about) then 'Forward'
    elsif /Goaltender/.match(player_about) then 'Goaltender'
    end
  end
end