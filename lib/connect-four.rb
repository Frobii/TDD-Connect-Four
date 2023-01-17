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
    
end

# game = Connect_Four.new
# game.draw_board
