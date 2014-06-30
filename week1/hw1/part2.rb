class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(p1, p2)
  # upcase because part1 used downcase
  p1[1].upcase
  p2[1].upcase
  
  # regex for accepted input
  raise NoSuchStrategyError unless p1[1] =~ /^(R|P|S){1}$/ && p2[1] =~ /^(R|P|S){1}$/ #error unless regex R P S for both players
  # If statement. Case was overkill (formatting thanks to ericwood #freenode #ruby)
  if p1[1] == "R" && p2[1] == "S" ||
     p1[1] == "P" && p2[1] == "R" || 
     p1[1] == "S" && p2[1] == "P" || 
     p1[1] == p2[1]
    return p1   #all of the conditions where P1 would win
  else 
    return p2   #if conditions are not met, p2 is winner
  end
  
  # this is a one line solution according to havenwood #ruby #freenode
  # an arrays of arrays. #any method takes block. in the block check p1 vs p2
  # ternary operator : ? :
  # [['R', 'S'], ['P', 'R'], ['S', 'P']].any? { |1, 2| p1[1] == p2[2] } ? p1 : p2
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2 # verify correct # of game 
  rps_result(game[0], game[1])                            # determines if p1 or p2
end

def rps_tournament_winner(tournament)
  if tournament[0][0].class == String                      
    return rps_game_winner(tournament)                    
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])]) #
  end
end

# TEST DATA

A = [ ["Armando", "P"], ["Dave", "S"] ]

tourn = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

#this is for test using data above

puts A.inspect
puts tourn.inspect
puts rps_tournament_winner(tourn).inspect
