require "./lib/importer.rb"
namespace :importer do
  desc "TODO"
  task import: :environment do
    Importer.call
  end

end
