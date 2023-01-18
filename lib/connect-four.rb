class Connect_Four
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def draw_board
    board.each do |row|
      puts row.map { |cell| cell || "☐"}.join(" ")
    end
  end

  def make_move(player)
    move = gets.to_i - 1
    if !(0..6).include?(move)
      puts "Invalid input. Please check your input and try again."
    else
      board.reverse.each_with_index do |row, index|
        if row[move].nil?
          row[move] = player
          break
        elsif index == 5
          puts "That row is full! Please select another one."
        end
      end
    end
  end

  def winner
    winning_lines.each do |line|
      return line.first if line.uniq.size == 1 && !line.first.nil?
    end
    nil
  end

  def winning_lines
    lines = []

    # verticle wins
    (0..2).each do |row|
      (0..6).each do |col|
        lines << [board[row][col], board[row+1][col], board[row+2][col], board[row+3][col]] 
      end
    end

    # horizontal wins
    (0..5).each do |row|
      (0..3).each do |col|
        lines << [board[row][col], board[row][col+1], board[row][col+2], board[row][col+3]] 
      end
    end

    # diagonal wins (top-left to bottom-right)
    (0..2).each do |row|
      (0..3).each do |col|
        lines << [board[row][col], board[row+1][col+1], board[row+2][col+2], board[row+3][col+3]]
      end
    end

    # diagonal wins (bottom-left to top-right)
    (0..2).each do |row|
      (0..3).each do |col|
        lines << [board[row+3][col], board[row+2][col+1], board[row+1][col+2], board[row][col+3]]
      end
    end

    return lines

  end
    
end

# game = Connect_Four.new
# game.draw_board
