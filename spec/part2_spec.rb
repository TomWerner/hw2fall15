require 'part2.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "#rps_game_winner" do
  it "should be defined" do
    lambda { rps_game_winner([["X", "P"], ["Y", "S"]]) }.should_not raise_error
    lambda { rps_game_winner([["X", "P"], ["Y", "S"]]) }.should_not raise_error
  end

  # this is given for free in the outline
  it "should raise WrongNumberOfPlayersError if there are not exactly two players" do
    lambda { rps_game_winner([ ["Allen", "S"] ]) }.should raise_error, "No error raised for incorrect number of players"
  end
  
  it "should return the correct winner if no tie" do
    expect(rps_game_winner([['Abby', 'R'], ['Bob', 'S']])).to eq(['Abby', 'R'])
    expect(rps_game_winner([['Cathy', 'S'], ['Doug', 'P']])).to eq(['Cathy', 'S'])
    expect(rps_game_winner([['Emma', 'P'], ['Fred', 'R']])).to eq(['Emma', 'P'])
    
    expect(rps_game_winner([['Abby', 'S'], ['Bob', 'R']])).to eq(['Bob', 'R'])
    expect(rps_game_winner([['Cathy', 'P'], ['Doug', 'S']])).to eq(['Doug', 'S'])
    expect(rps_game_winner([['Emma', 'R'], ['Fred', 'P']])).to eq(['Fred', 'P'])
  end
  
  it "should return the first player if its a tie" do
    expect(rps_game_winner([['Abby', 'R'], ['Bob', 'R']])).to eq(['Abby', 'R'])
    expect(rps_game_winner([['Cathy', 'P'], ['Doug', 'P']])).to eq(['Cathy', 'P'])
    expect(rps_game_winner([['Emma', 'S'], ['Fred', 'S']])).to eq(['Emma', 'S'])
  end
  
  it "should only allow valid plays" do
    lambda { rps_game_winner([['Abby', 'T'], ['Barbara', 'P']]) }.should raise_error(NoSuchStrategyError)
    lambda { rps_game_winner([['Abby', 'R'], ['Bobby', 'W']]) }.should raise_error(NoSuchStrategyError)
  end
end

describe "#rps_tournament_winner" do
  it "should be defined" do
    lambda { rps_tournament_winner([["X", "P"], ["Y", "S"]]) }.should_not raise_error
  end
  
  it "should handle a single match tournament" do
    expect(rps_tournament_winner([['Abby', 'R'], ['Bob', 'S']])).to eq(['Abby', 'R'])
  end
  
  it "should handle depth two" do
    match1 = [['Abby', 'R'], ['Bob', 'S']]
    match2 = [['Cathy', 'S'], ['Doug', 'P']]
    expect(rps_tournament_winner([match1, match2])).to eq(['Abby', 'R'])
  end
  
  it "should handle the example tournament" do 
    tournament = [
      [
        [ ["Joe", "P"], ["Mary", "S"] ],
        [ ["Bob", "R"], ["Alice", "S"] ]
      ],
      [
        [ ["Steve", "S"], ["Jane", "P"] ],
        [ ["Ted", "R"], ["Carol", "P"] ]
      ]
    ]
    expect(rps_tournament_winner(tournament)).to eq(['Bob', 'R'])
  end
end
