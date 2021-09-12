require './Board'
require './Player'
class Game
  def initialize(player1, player2)
    @player1 = Player.new(player1[:name], player1[:symbol])
    @player2 = Player.new(player2[:name], player2[:symbol])
    @board = Board.new
  end

  def start_game
    game_loop
  end

  def self.clear_console
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end

  private

  def game_loop
    turn_count = 0
    @winner_not_declared = true
    player = @player1
    while @winner_not_declared
      if turn_count >= 9
        Game.clear_console
        @board.print_board
        puts 'There is no winner this time ;p'
        break
      end
      # clear the screen
      Game.clear_console
      # print the board
      @board.print_board
      puts ''
      # ask player for a move
      puts "#{player.name}, Please select your move ex:(1-9)"
      move = gets.chomp.to_i
      # try to execute the move
      move_success = @board.play_move(player.symbol, move)
      next unless move_success == true

      # if successful check to see if the player wins
      is_winner = winner?(player) if move_success
      # if the player wins print the winning player and break the loop
      Game.clear_console if is_winner
      @board.print_board if is_winner
      puts "#{player.name}, You are the winner!" if is_winner
      @winner_not_declared = false if is_winner
      gets if is_winner
      # if the player doesnt win change players and repeat the loop
      player = player == @player1 ? @player2 : @player1
      turn_count += 1
    end
  end

  def winner?(player)
    @board.board_check(player.symbol)
  end

  def no_winner?(player1, player2)
    player1_status = @board.board_check(player1.symbol)
    player2_status = @board.board_check(player2.symbol)
    player1_status && player2_status
  end
end
