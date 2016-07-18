ENV['RACK_ENV'] = 'test'
require('rspec')
require('capybara/rspec')
require('sinatra/activerecord')
require('team')
require('player')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Team.all().each() do |team|
      team.destroy()
    end
    Player.all().each() do |player|
      player.destroy()
    end
  end
end
