require './Game'
module App
  player1_name = ''
  player2_name = ''
  while player1_name == ''
    Game.clear_console
    puts 'Player 1 please enter your name'
    player1_name = gets.chomp
  end
  while player2_name == '' || player2_name == player1_name
    Game.clear_console
    puts 'Player 2 please enter your name'
    player2_name = gets.chomp
  end
  game = Game.new({ name: player1_name, symbol: 'X' }, { name: player2_name, symbol: 'Y' })
  game.start_game
end
