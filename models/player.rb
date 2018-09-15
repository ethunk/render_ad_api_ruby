class Player
  attr_reader :name, :position, :team_name
  @@instances = []
  def initialize(team, position, name)
    @name = name
    @position = position
    @team_name = team
    @@instances << self
  end

  def self.all
    @@instances
  end
end
