require 'pry'
require_relative './player.rb'
require_relative './team.rb'
class TeamData
  ROLL_CALL =
  {
    "Simpson Slammers": {
      "Catcher": "Bart Simpson",
      "Pitcher": "Homer Simpson",
      "1st Base": "Marge Simpson",
      "2nd Base": "Lisa Simpson",
      "3rd Base": "Ned Flanders",
      "Shortstop": "Barney Grumble",
      "Right Field": "Monty Burns",
      "Center Field": "Waylon Smithers",
      "Left Field": "Clancy Wiggum"
    },

    "Jetson Jets": {
      "Catcher": "George Jetson",
      "Pitcher": "Jane Jetson",
      "1st Base": "Judy Jetson",
      "2nd Base": "Elroy Jetson",
      "3rd Base": "Astro Jetson",
      "Shortstop": "Orbitty Jetson",
      "Right Field": "Cosmo Spacely",
      "Center Field": "Rosie Jetson",
      "Left Field": "Stella Spacely"
    },

    "Flintstone Fire": {
      "Catcher": "Fred Flintstone",
      "Pitcher": "Wilma Flintstone",
      "1st Base": "Dino Flintstone",
      "2nd Base": "Barney Rubble",
      "3rd Base": "Betty Rubble",
      "Shortstop": "Pebbles Flintstone",
      "Right Field": "Joe Rockhead",
      "Center Field": "Sam Slagheap",
      "Left Field": "Sylvester Slate"
    },

    "Griffin Goats": {
      "Catcher": "Lois Griffin",
      "Pitcher": "Brian Griffin",
      "1st Base": "Peter Griffin",
      "2nd Base": "Stewie Griffin",
      "3rd Base": "Chris Griffin",
      "Shortstop": "Glenn Quagmire",
      "Right Field": "Cleveland Brown",
      "Center Field": "Tom Tucker",
      "Left Field": "Meg Griffin"
    }
  }
end


data = TeamData::ROLL_CALL
TEAMS = []
data.keys.each do |team_name|
  holder = Team.new(team_name)
  TEAMS << Team.new(team_name)
end
PLAYERS = []
data.each do |team_data|
  team_name = team_data[0].to_s
  team_data[1].each do |position, player_name|
    PLAYERS << Player.new(team_name, position.to_s,player_name)
  end
end
POSITIONS = []
PLAYERS.each do |player|
  if POSITIONS.include?(player.position)
    next
  else
    POSITIONS << player.position
  end
end