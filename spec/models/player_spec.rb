require "spec_helper"

RSpec.describe Player do
  let(:player_one) {Player.new('team1','position1','name1')}
  let(:player_two) {Player.new('team2','position2','name2')}
  let(:player_three) {Player.new('team3','position3','name3')}

  it "initializes with three inputs" do
    expect{Player.new('something')}.to raise_error(ArgumentError)
    expect(Player.new('team','position','name')).to be_truthy
  end

  it 'has a reader for name, position, and team' do
    expect(player_one.name).to be_truthy
    expect(player_one.team_name).to be_truthy
    expect(player_one.position).to be_truthy
  end

  it 'has an #all class method that returns an array of all the Player objects' do
    expect(Player.all).to be_a(Array)
    keeper = [player_one, player_two, player_three]
    expect(Player.all.size).to be >= (3)
  end
end
