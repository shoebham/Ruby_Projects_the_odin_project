LINES = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7],[1,4,7],[2,5,8],[3,6,9]]


    class Game 
            def initialize(player_1_class,player_2_class)
                @board = Array.new(10)
                @current_player_id=0
                @players = [player_1_class.new(self,"X",1),player_2_class.new(self,"O",2)]
                puts "#{current_player} goes first"
            end
            attr_reader :board, :current_player_id
            
            def play 
                loop do
                    place_marker(current_player)
                    
                    if player_won?(current_player)
                        p "#{current_player} is the winner"
                        print_board
                        return
                    elsif board_full?
                        p "It's a draw!"
                        print_board
                        return
                    end
                    
                    switch_player!
                    
                end
            end
            
            def free_positions
                (1..9).select{|pos| @board[pos].nil?}
            end
            
            def place_marker(player)
                position = player.select_position!
                p "#{player} selects #{player.marker} position #{position}"
                @board[position] = player.marker
            end
            
            def player_won?(player)
                LINES.any? do |i|
                    i.all? {|j| @board[j] == player.marker}
                end
            end
            
            
            def board_full?
                 free_positions.empty?
             end
             
            def other_player_id
                1-@current_player_id
            end
            
            def switch_player!
                @current_player_id = other_player_id
            end
            
            def current_player
                @players[current_player_id]
            end
            
            
            def print_board
                col_sep = " | "
                row_sep = "--+---+--"
                label_pos = ->(pos){  @board[pos] ? @board[pos] : pos}
                row_for_display= ->(row){row.map(&label_pos).join(col_sep)}
                row_pos = [[1,2,3],[4,5,6],[7,8,9]]
                rows_for_display=row_pos.map(&row_for_display)
                puts rows_for_display.join("\n"+ row_sep +"\n")
            end
    end

    class Player
        attr_reader:marker,:num
        def initialize(game,marker,num)
            @game = game
            @marker =marker
            @num = num
        end
    end
        
    class HumanPlayer < Player
        attr_reader:i
        
        
            def select_position!
                @game.print_board
                loop do
                    puts "Select your #{marker} position"
                    selection = gets.to_i
                    return selection if @game.free_positions.include?(selection) 
                    puts  "position #{selection} position is not available"
                end
            end
            
            def to_s
                "Human #{num}"
            end
        end

puts players_with_human = [HumanPlayer, HumanPlayer].shuffle
Game.new(*players_with_human).play