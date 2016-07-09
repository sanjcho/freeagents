require "rails_helper"

RSpec.describe Player, :type => :model do
  before do
    Player.create!(name: "forward_18", season: 18, role: "Forward")
    Player.create!(name: "defenceman_19", season: 19, role: "Defenceman")
    Player.create!(name: "goalkeeper", season: 20, role: "Goaltender")
  end

  context "scope " do
    it "forward must return only players with forward role" do
      expect(Player.forward.count).to eq 1
      expect(Player.forward.first.role).to eq "Forward"
    end

    it "defenceman must return only players with defenceman role" do
      expect(Player.defenceman.count).to eq 1
      expect(Player.defenceman.first.role).to eq "Defenceman"
    end
    it "goalkeeper must return only players with goalkeeper role" do
      expect(Player.goalkeeper.count).to eq 1
      expect(Player.goalkeeper.first.role).to eq "Goaltender"
    end
    it "season1718 must return only players with season eq 18" do
      expect(Player.season1718.count).to eq 1
      expect(Player.season1718.first.season).to eq 18
    end
    it "season1819 must return only players with season eq 19" do
      expect(Player.season1819.count).to eq 1
      expect(Player.season1819.first.season).to eq 19
    end    
    it "season1920 must return only players with season eq 20" do
      expect(Player.season1920.count).to eq 1
      expect(Player.season1920.first.season).to eq 20
    end
  end
end