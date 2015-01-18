def initial_game_position
  b ={}
  (1..9).each{|position| b[position] = " "}
  b
end
def current_game_position_player(b, a)
  b[a] = "X"
  b
end
def current_game_position_computer(b, a)
  b[a] = "O"
  b
end
def draw_layout(b)
  system 'clear'
  puts "\n"
  puts "     |     |"
  puts "  " + b[1] + "  |  " + b[2] + "  |  " + b[3]
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  " + b[4] + "  |  " + b[5] + "  |  " + b[6]
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  " + b[7] + "  |  " + b[8] + "  |  " + b[9]
  puts "     |     |"
end
def player_selection
 puts "Pick a square (1 - 9):"
 selection = gets.chomp.to_i
end
def computer_selection(b)
  selection = b.select{|k,v| v == ' ' }.keys.sample
end
def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7],[2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if b.values_at(*line).count("X") == 3
    return "Computer" if b.values_at(*line).count("O") == 3
   end
   nil
end

puts "\n"
puts "Welcome to Tic Tac Toe"
puts "\n"
game_status = initial_game_position
draw_layout(game_status)
puts "\n"
puts "Choose a position (from 1 to 9) to place your selection"
puts "Your selections will be represented by a cross (X)"
puts "\n"
begin
  player_choice = player_selection
  draw_layout(current_game_position_player(game_status, player_choice))
  computer_choice = computer_selection(game_status)
  draw_layout(current_game_position_computer(game_status, computer_choice))
  winner = check_winner(game_status)
end until winner == "Player" || winner == "Computer" || !(game_status.has_value?(" "))
if winner
  puts "#{winner} won!"
else
  puts "It's a tie"
end