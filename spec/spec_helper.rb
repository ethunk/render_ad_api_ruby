require "rspec"
require "capybara"
require "capybara/rspec"
require 'pry'
require_relative "../models/player.rb"
require_relative "../models/team_data.rb"
require_relative "../models/team.rb"
require_relative "../models/player.rb"


require_relative "../app"

Capybara.app = Sinatra::Application
