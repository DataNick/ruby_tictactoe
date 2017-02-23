class Board
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

end