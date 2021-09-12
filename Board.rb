class Board
  attr_reader :board

  def initialize
    @board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  end

  def play_move(player_symbol, position)
    return unless position.positive? && position < 10

    # TODO: modify checks to use loops not hard coded values
    case position
    when 1
      return false if @board[0][0] == player_symbol

      @board[0][0] = player_symbol if @board[0][0] == 0
      return true if @board[0][0] == player_symbol
    when 2
      return false if @board[0][1] == player_symbol

      @board[0][1] = player_symbol if @board[0][1] == 0
      return true if @board[0][1] == player_symbol
    when 3
      return false if @board[0][2] == player_symbol

      @board[0][2] = player_symbol if @board[0][2] == 0
      return true if @board[0][2] == player_symbol
    when 4
      return false if @board[1][0] == player_symbol

      @board[1][0] = player_symbol if @board[1][0] == 0
      return true if @board[1][0] == player_symbol
    when 5
      return false if @board[1][1] == player_symbol

      @board[1][1] = player_symbol if @board[1][1] == 0
      return true if @board[1][1] == player_symbol
    when 6
      return false if @board[1][2] == player_symbol

      @board[1][2] = player_symbol if @board[1][2] == 0
      return true if @board[1][2] == player_symbol
    when 7
      return false if @board[2][0] == player_symbol

      @board[2][0] = player_symbol if @board[2][0] == 0
      return true if @board[2][0] == player_symbol
    when 8
      return false if @board[2][1] == player_symbol

      @board[2][1] = player_symbol if @board[2][1] == 0
      return true if @board[2][1] == player_symbol
    when 9
      return false if @board[2][2] == player_symbol

      @board[2][2] = player_symbol if @board[2][2] == 0
      return true if @board[2][2] == player_symbol
    else
      false
    end
  end

  def print_board
    count = 1
    @board.each do |board_row|
      board_row.each do |board_cell|
        print "#{board_cell}  " unless board_cell == 0
        print "#{count}  " if board_cell == 0
        count += 1
      end
      puts ''
    end
  end

  def board_check(symbol)
    # TODO: extract these checks into functions and use a loop instead of hard coding all the states
    # check rows to see if player is winner
    @board.each do |row|
      return true if row[0] == row[1] && row[1] == row[2] && row[2] == symbol
    end
    # check columns to see if player is winner
    return true if @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0] && @board[2][0] == symbol
    return true if @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1] && @board[2][1] == symbol
    return true if @board[0][2] == @board[1][2] && @board[1][1] == @board[2][2] && @board[2][2] == symbol
    # check diagonally to see if player is winner
    return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[2][2] == symbol
    return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[2][0] == symbol

    false
  end
end
