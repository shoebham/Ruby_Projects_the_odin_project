require "./lib/board.rb"
require "./lib/player.rb"
class Game
    attr_accessor :board

    def initialize
        @board = Board.new
    end
    
    def game_over?
        check_winner
    end


    def play
        start
        until game_over? do 
          
            board.display
            player_move(@player1)
            board.display
           
            return "Player 1 wins" if game_over?
            player_move(@player2)
            board.display
        end
    end

    def start
        puts "Choose one: X or O"
        piece1 = gets.chomp.upcase
        if piece1!= "X" || piece1 != "O"
        until piece1== "X" || piece1 == "O" do
            puts "Invalid input. Please try again"
            piece1 = gets.chomp.upcase
        end
    end
        piece1 == "X" ? piece2 = "O" : piece2 ="X"
        @player1 = Player.new(piece1,1)
        puts "Player 1 has #{piece1} and Player 2 has #{piece2}"
        @player2 = Player.new(piece2,2)
    end


    def player_move(player)
        begin
        puts "Player #{player.number}'s turn"
        puts "Player1 - #{@player1.piece}, Player2 - #{@player2.piece}"
        input = gets.chomp!
        input =input.to_i 
        check_input(input)
        puts input
        board.move(player.piece,input)
        rescue => exception 
            puts "#{exception}"
        retry 
        end
    end
    def check_input(input)
      if input>7 || input<=0
        raise "Enter values between 1-7"
      end
    end
    def game_over?
        # horizontal
        return true if board.horizontal(@player1.piece)
        return true if board.vertical(@player1.piece)
        return true if board.diagonal(@player1.piece)
        if board.board_full?(board.grid)
            puts "Board Full!!"
            return true  
        end
        # diagonal
        return false
    end
end
Game.new.play


