require_relative "../lib/connect-four.rb"

describe "#initialize" do
  let (:game) { Connect_Four.new }

  it "creates a 2D array representing a connect four cage: 6x7" do
    board = game.instance_variable_get(:@board)
    expect(board.size).to eq(6)
    expect(board[0].size).to eq(7)
  end

end

describe "#draw_board" do
  let (:game) { Connect_Four.new }

  context "when the draw method is called" do
    it "prints a visual representation of the board to the console" do
        expect { game.draw_board }.to output(/☐ ☐ ☐ ☐ ☐ ☐ ☐\n☐ ☐ ☐ ☐ ☐ ☐ ☐\n☐ ☐ ☐ ☐ ☐ ☐ ☐\n☐ ☐ ☐ ☐ ☐ ☐ ☐\n☐ ☐ ☐ ☐ ☐ ☐ ☐\n☐ ☐ ☐ ☐ ☐ ☐ ☐\n/).to_stdout
    end
  end

end

describe "#make_move" do
  let (:game) { Connect_Four.new }

  context "when a player selects a row" do
    before do 
      allow(game).to receive(:gets).and_return("3")
      game.make_move(:x)
      allow(game).to receive(:gets).and_return("3")
      game.make_move(:x)
      allow(game).to receive(:gets).and_return("3")
      game.make_move(:x)
      allow(game).to receive(:gets).and_return("3")
      game.make_move(:x)
      allow(game).to receive(:gets).and_return("3")
      game.make_move(:x)
      allow(game).to receive(:gets).and_return("3")
      game.make_move(:x)
    end

    it "places their symbol in the correct position" do
      expect(game.board[5][2]).to eq :x
    end

    it "places their symbol on top of their previous input" do
      expect(game.board[4][2]).to eq :x
    end

    it "rejects it if every position is full in that row" do
        allow(game).to receive(:gets).and_return("3")
        expect{ game.make_move(:x)}.to output(/That row is full! Please select another one./).to_stdout
    end


  end

  subject(:invalid_game) { Connect_Four.new }

  context "when something other than a valid input is made" do

    it "writes an error to the console" do
      allow(invalid_game).to receive(:gets).and_return("A")
      expect{ invalid_game.make_move(:x)}.to output(/Invalid input. Please check your input and try again./).to_stdout
    end

  end

end

describe "#winner" do

  subject(:winning_game) { Connect_Four.new }
  
  context "when a player lines up four of their symbol in a row vertically" do
    before do
      winning_game.board[0][0] = :x
      winning_game.board[1][0] = :x
      winning_game.board[2][0] = :x
      winning_game.board[3][0] = :x
    end

    it "a winner is found" do
      expect(winning_game.winner).to eq :x
    end

  end

  subject(:winning_game) { Connect_Four.new }
  
  context "when a player lines up four of their symbol in a row horizontally" do
    before do
      winning_game.board[0][0] = :x
      winning_game.board[0][1] = :x
      winning_game.board[0][2] = :x
      winning_game.board[0][3] = :x
    end

    it "a winner is found" do
      expect(winning_game.winner).to eq :x
    end

  end

  subject(:winning_game) { Connect_Four.new }
  
  context "when a player lines up four of their symbol in a row diagonally" do
    before do
      winning_game.board[0][0] = :x
      winning_game.board[1][1] = :x
      winning_game.board[2][2] = :x
      winning_game.board[3][3] = :x
    end

    it "a winner is found" do
      expect(winning_game.winner).to eq :x
    end

  end

end

describe "#play_game" do

  subject(:looping_game) { Connect_Four.new }

  context "after a player makes a move" do

    it "swaps to the other player's symbol" do

    end

  end

end

