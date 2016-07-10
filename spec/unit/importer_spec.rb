require "rails_helper"
require "importer"

RSpec.describe Importer do
  context "method" do
    it "get_role must return 'Defenceman' if 'Defence' exist in input string" do
      expect(Importer.new.get_role("some string with Defence included")).to eq "Defenceman"
    end
    it "get_role must return false if 'Defence' not exist in input string" do
      expect(Importer.new.get_role("some string without right DefenSe included")).to be_falsy
    end    
    it "get_role must return 'Forward' if 'Left' exist in input string" do
      expect(Importer.new.get_role("some string with Left included")).to eq "Forward"
    end
    it "get_role must return false if 'Left' not exist in input string" do
      expect(Importer.new.get_role("some string without right LefT included")).to be_falsy
    end   
    it "get_role must return 'Goaltender' if 'Goaltender' exist in input string" do
      expect(Importer.new.get_role("some string with Goaltender included")).to eq "Goaltender"
    end
    it "get_role must return false if 'Goaltender' not exist in input string" do
      expect(Importer.new.get_role("some string without right Goal tender included")).to be_falsy
    end
  end

  context "parsing presaved test page BostonBruins.html" do
    before do 
      Importer.new.parse_players("./spec/BostonBruins.html", "BostonBruins", "src of team-logo")
    end
    it "number of UFA player is 6" do
      expect(Player.count).to be 6
    end
    it "first player is Marchand, Brad with caphit = 4.5, role = Forward and season = 18" do
      player = Player.first
      expect(player.name).to eq "Marchand, Brad"
      expect(player.caphit).to eq 4.5
      expect(player.season).to be 18
    end
    it "first player is Khudobin, Anton with caphit = 1.2, role = Goalkeeper and season = 19" do
      player = Player.last
      expect(player.name).to eq "Khudobin, Anton"
      expect(player.caphit).to eq 1.2
      expect(player.season).to be 19
    end
  end
end