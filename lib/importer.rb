require "nokogiri"
require "open-uri"
require "uri/http"
require "thread/pool"

class Importer  

  def self.call
    Team.destroy_all
    new.parse_teams
  end



  def parse_teams
    page = Nokogiri::HTML(open("http://nhlnumbers.com/"))
    page.css("a.team").each do |team_parsed|
      team = team_creation(team_parsed.css('img').first['alt'], team_parsed.css('img').first['src'])
      parse_players(team_parsed['href'], team)
    end
  end

  def parse_players(src, team)
    page = Nokogiri::HTML(open(src))
    page.css('tr'). each do |player_page|
      caphit = player_page.css('td.caphit')[0].text if player_page.css('td.caphit')[0]
      if caphit.to_f >= 1 && player_page.css("a.active")[0] && season = which_season(player_page)
        player = team.players.new
        player.name = player_page.css("a.active")[0].text
        player.role = get_role(player_page.css('a')[0].to_s)
        player.caphit = caphit.to_f
        puts player.season = season
        player.save
      end
    end
  end

  def which_season(player_page)
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
    if /Defence/.match(player_about) then 'Defencemen'
    elsif /Center|Right|Left/.match(player_about) then 'Forward'
    elsif /Goaltender/.match(player_about) then 'Goaltender'
    end
  end

  def team_creation(name, image)
    puts "Importing " + name + " players"
    team = Team.create(name: name, image: image)
    #team.save
  end
end