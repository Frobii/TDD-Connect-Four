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
      board.reverse.each do |row|
        if row[move].nil?
            row[move] = player
            break
        end
      end
    end
  end
    
end


# game = Connect_Four.new
# game.make_move(:x)
# game.make_move(:x)
# game.draw_board
