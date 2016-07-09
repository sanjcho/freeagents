require "rails_helper"
require "importer"
#require "./lib/importer.rb"

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
end