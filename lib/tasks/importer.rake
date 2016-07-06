require "./lib/importer.rb"
namespace :importer do
  desc "TODO"
  task import: :environment do
    Importer.new.parse_teams
  end

end
