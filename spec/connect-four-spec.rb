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
    end

    it "places their symbol in the correct position" do
      expect(game.board[5][2]).to eq :x
    end

    it "places their symbol on top of their previous input" do
      expect(game.board[4][2]).to eq :x
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