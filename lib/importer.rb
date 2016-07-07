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
    page.css('tr').drop(3).each do |player|
      caphit = player.css('td.caphit')[0].text if player.css('td.caphit')[0]
      #puts caphit
      puts player.css("a.active")[0].text if caphit.to_i >= 1 && player.css("a.active")[0]
    end
  end

end