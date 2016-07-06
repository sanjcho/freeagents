require "nokogiri"
require "open-uri"
require "uri/http"

class Importer  

  def make_parse
    
  end

  def parse_teams 
    page = Nokogiri::HTML(open("http://nhlnumbers.com/"))
    page.css("a.team").each do |team|
      puts team
    end
  end


end