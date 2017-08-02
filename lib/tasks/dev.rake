# To run:
# bin/rake dev:seed
require "factory_girl"
require "faker"

namespace :dev do
  desc "Generate random phrases to seed the database"
  task :seed, [:number] => :environment do |task, args|
    include FactoryGirl::Syntax::Methods

    number = args.number.to_i

    if number == 0
      puts "Please define the number of phrases to create."
      puts "Example:"
      puts "rake dev:seed[10]"
      next
    end

    puts "Generating #{number} random phrases..."

    number.times do
      create(:phrase, text: Faker::Lorem.sentence)
    end

    total = Phrase.count
    puts "There is now a total of #{total} phrase records in the database."
  end
end
