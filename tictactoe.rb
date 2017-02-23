require_relative 'board.rb'

puts "Start game..."
players = ['X', 'O']
current_player = players[rand(2)]
b = Board.new(current_player)
b.display_board
state = true

while !b.board_full? && !b.winner
  b.ask_player_for_move(current_player)
  if current_player == 'X'
    current_player = 'O'
  else
    current_player = 'X'
  end
end