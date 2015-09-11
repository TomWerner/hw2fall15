class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
class PlayerFormatError < StandardError ; end
class MisformattedTournamentError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise PlayerFormatError unless game[0].length == 2 and game[1].length == 2
  return game[1] if game[1][1].beats game[0][1]
  return game[0]
end

def rps_tournament_winner(tournament)
  raise MisformattedTournamentError if tournament.length != 2 or tournament[0].class != tournament[1].class
  if tournament[0][0].class != Array
    return rps_game_winner(tournament)
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end

#feel free to add your own helper functions as needed

class String
  def beats(other)
    raise NoSuchStrategyError if self.gsub(/[rps]/i, '').length > 0 || other.gsub(/[rps]/i, '').length > 0
    return ((self.upcase == 'R' and other.upcase == 'S') or 
            (self.upcase == 'S' and other.upcase == 'P') or 
            (self.upcase == 'P' and other.upcase == 'R'))
  end
end