require "../lib/board.rb"
# require "../lib/player.rb"
# require "../lib/game.rb"

describe 'Board' do 
   describe 'board_full?' do 
    it "Checks if the board is full or not" do
        grid  = [
        ['X', 'O', 'X', 'O', 'X', 'X', 'X'],
        ['X', 'O', 'X', 'O', 'X', 'X', 'X'],
        ['X', 'O', 'X', 'O', 'X', 'O', 'X'],
        ['O', 'X', 'O', 'X', 'O', 'X', 'O'],
        ['O', 'X', 'O', 'X', 'O', 'X', 'O'],
        ['O', 'X', 'O', 'X', 'O', 'X', 'O']]
        board =  Board.new
        expect(board.board_full?(grid)).to eql(true)
        end
    end

    describe 'horizontal' do 
        it "Checks if there is a horizontal pair" do 
            grid  = [
                ['O', 'X', 'O', ' ', ' ', ' ', ' '],
                ['X', 'O', 'X', ' ', ' ', ' ', ' '],
                ['O', 'X', 'O', ' ', ' ', ' ', ' '],
                ['X', 'O', 'X', ' ', ' ', ' ', ' '],
                ['O', 'X', 'O', ' ', ' ', ' ', ' '],
                ['X', 'O', 'X', 'X', ' ', ' ', ' ']
            ]
                board =  Board.new
                expect(board.diagonal('X')).to eql(true)
            end
        end
                
end
