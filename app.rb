require "sinatra"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces
use Rack::Session::Cookie, {
  expire_after: 20
}

get "/" do
  @teams = TeamData::ROLL_CALL
  erb :index
end

get "/variables" do
  @teams = Team::TEAMS
  erb :teams
end

get "/teams/:team_roster" do
  @team_name = params[:team_roster]
  @all_players = TeamData::PLAYERS
  @all_teams = TeamData::TEAMS
  @players = []
  @all_players.each do |player|
    if player.team_name == @team_name
      @players << player
    end
  end
  erb :team_roster
end

get "/players" do
  @players = TeamData::PLAYERS
  erb :players
end

get "/positions" do
  @positions = TeamData::POSITIONS
  erb :positions
end
