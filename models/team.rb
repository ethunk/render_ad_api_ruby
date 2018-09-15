require_relative "./player.rb"
require 'pry'

class Team

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def players
    player_data = Player.all
    team_players = []
    player_data.each do |player|
      if player.team_name == @name
        team_players << player
      end
    end
    return team_players
  end

end







# data = Team.new('Simpson Slammers')
# player_one = Player.new('Simpson Slammers', 'Catcher', 'Bart Simpson')
# player_two = Player.new('Simpson Slammers', 'Catcher', 'Sarah Simpson')
# player_three = Player.new('Simpson Slammers', 'Catcher', 'Eric Simpson')
# player_four = Player.new('Simpson Slammers', 'Catcher', 'Ethan Simpson')
# data.players
# binding.pry
