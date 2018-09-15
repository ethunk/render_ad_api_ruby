require "spec_helper"


RSpec.describe Team do
  let(:example_one) {Team.new('Eric')}
  let(:example_two) {Team.new('Adam')}
  let(:example_three) {Team.new('Sarah')}


  it "should be initialized with a name" do
    expect {Team.new()}.to raise_error(ArgumentError)
    expect(Team.new('Eric')).to be_truthy
  end
  it 'should have only a reader associated with the name' do
    expect(example_one.name).to be_truthy
    expect{example_one.name = 'Tommy'}.to raise_error(NoMethodError)
  end
  it 'should have an #players class method that returns an array' do
    player_one = Player.new('Simpson Slammers', 'Catcher', 'Bart Simpson')
    player_two = Player.new('Simpson Slammers', 'Catcher', 'Sarah Simpson')
    player_three = Player.new('Simpson Slammers', 'Catcher', 'Eric Simpson')
    player_four = Player.new('Simpson Slammers', 'Catcher', 'Ethan Simpson')
    team = Team.new('Simpson Slammers')
    expect(team.players).to be_a(Array)
    expect(team.players.size).to be >= 3
  end
end
