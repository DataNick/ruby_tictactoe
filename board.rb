require 'pry'

class Board
  attr_reader :current_player

  MAX_BOARD_INDEX = 2
  EMPTY_POS = ""

  def initialize(current_player)
    @current_player = current_player
    @board = Array.new(MAX_BOARD_INDEX + 1){ Array.new(MAX_BOARD_INDEX + 1){ EMPTY_POS } }
  end

  def display_board
    puts "+- - - - +"
    for row in (0..MAX_BOARD_INDEX)
      print "| "
      for col in (0..MAX_BOARD_INDEX)
        s = @board[row][col]
        if s == EMPTY_POS
          print col + (row * 3) + 1
        else
          print s
        end
        print "| "
      end
      puts "\n- - - - - -"
    end
  end

  def ask_player_for_move(current_player)
    played = false
    while not played
      puts "Where would you like to move?"
      move = gets.chomp.to_i - 1
      col = move % @board.size
      row = (move - col) / @board.size
      @board[row][col] = current_player
      display_board
      played = true
    end
  end

  def board_full?
    for row in 0..MAX_BOARD_INDEX
      for col in 0..MAX_BOARD_INDEX
        if @board[row][col] == EMPTY_POS
          return false
        end
      end
    end
    return true
  end

  def winner
    winner = winner_across
    if winner
      return winner
    end
    winner = winner_col
    if winner
      return winner
    end
    winner = winner_diagonal
    if winner
      return winner
    end
  end

  def winner_across
    for row in 0..MAX_BOARD_INDEX
      first_symbol = @board[row][0]
      for col in 1..MAX_BOARD_INDEX
        if first_symbol != @board[row][col]
          break
        elsif col == MAX_BOARD_INDEX and first_symbol != EMPTY_POS
          return first_symbol
        end
      end
    end
    return
  end

  def winner_col
    for col in 0..MAX_BOARD_INDEX
      first_symbol = @board[0][col]
      for row in 0..MAX_BOARD_INDEX
        if first_symbol != @board[row][col]
          break
        elsif row == MAX_BOARD_INDEX and first_symbol != EMPTY_POS
          return first_symbol
        end
      end
    end
    return
  end

  def winner_diagonal
    first_symbol = @board[0][0]
    for index in 1..MAX_BOARD_INDEX
      if first_symbol != @board[index][index]
        break
      elsif index == MAX_BOARD_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    # binding.pry
    first_symbol = @board[0][MAX_BOARD_INDEX]
    row = 0
    col = MAX_BOARD_INDEX
    while row < MAX_BOARD_INDEX # removed <= condition since it iterated row to 3 and @board is undefined at that point
      row = row + 1
      col = col - 1
      # binding.pry
      if first_symbol != @board[row][col]
        break
      elsif row == MAX_BOARD_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    return
  end
end



