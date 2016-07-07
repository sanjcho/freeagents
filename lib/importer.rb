require "nokogiri"
require "open-uri"
require "uri/http"

class Importer  

  def make_parse
    
  end

  def parse_teams
    Team.delete_all
    page = Nokogiri::HTML(open("http://nhlnumbers.com/"))
    page.css("a.team").each do |team_parsed|
      team = Team.new
      parse_players(team_parsed['href'])
      team.name = team_parsed.css('img').first['alt']
      team.image = team_parsed.css('img').first['src']
      team.save
    end
  end

  def parse_players(src)
    page = Nokogiri::HTML(open(src))
    #puts page.css("a.active")[0].text #player names
    page.css('tr'). each do |player|
      caphit = player.css('td.caphit')[0].text if player.css('td.caphit')[0]
      #puts caphit

      if caphit.to_i >= 1 && player.css("a.active")[0]
        puts get_role(player.css('a')[0].to_s) if is_UFA?(player)
      end
    end
  end

  def is_UFA?(player)
    player.css('td')[5, 3].each do |maybeUFA|
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