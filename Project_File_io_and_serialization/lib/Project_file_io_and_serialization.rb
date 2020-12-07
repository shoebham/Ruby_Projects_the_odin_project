require 'yaml'
class Game
    attr_accessor :key,:key_clues,:guessed,:guesses
    def initialize 
        @key = random_word
        puts "Random word is : #{@key}"
        @key_clues = ""
        @key.length.times { @key_clues << '-'}   
        @guessed = []
        @guesses = 15 
    end


    def save_game
        puts "Enter the name of the your saved game: "
        saved_name = gets.chomp
        Dir.mkdir('saved_games') unless Dir.exists? ('saved_games')
        File.open("./saved_games/#{saved_name}.yml", 'w') { |f| YAML.dump([] << self, f) }
        exit
        puts "File saved."
    end
    
    def load_game
        unless Dir.exists?('saved_games')
            puts "No saved games found"
            return
        end
        # puts "Enter name of the file you want to load"
        # filenames = Dir.glob("saved_games/*").map {|file| file[(file.index('/')+1)...(file.index('.'))]}
        # puts "Files: "
        # puts filenames
        # load_file = gets.chomp
        # deserialize(load_file)
        games = saved_games
        puts games
        deserialize(load_file(games))
    end
    def load_file(games)
        loop do
          puts 'Enter which saved_game would you like to load: '
          load_file = gets.chomp
          return load_file if games.include?(load_file)
          puts 'The game you requested does not exist.'
        end
    end

    def deserialize(load_file)
        yaml = YAML.load_file("./saved_games/#{load_file}.yml")
        @key = yaml[0].key
        @key_clues = yaml[0].key_clues
        @guesses = yaml[0].guesses
        @guessed = yaml[0].guessed 
     end
       def saved_games
        puts 'Saved games: '
        Dir['./saved_games/*'].map { |file| file.split('/')[-1].split('.')[0] }
      end 
    

    def game_menu
        puts "Enter your choice\n[1] New Game\n[2] Load Game"
        input = gets.chomp
        load_game if input == '2'
        save_game if start_game == 'save'
    end 
    def start_game
        until self.game_over? 
            begin
                puts
                display  
                puts "Enter a letter:"
                puts "Random word is : #{@key}"
                guess = gets.chomp  
                puts
                guess.downcase!
                return "save" if guess == "save"
                raise "Invalid input: #{guess}" unless /[[:alpha:]]/.match(guess) && guess.length == 1
                raise "You've already guessed that letter!" if @guessed.include?(guess)
                enter_guess(guess.downcase)
                    
            rescue StandardError => exception
                puts exception.to_s
                retry
            end
        end
    end
    def game_over?
        if @key == @key_clues
            puts "Hooray! You guessed the word #{@key}"
            true
        elsif @guesses==0
            puts "You lost!\nBetter Luck Next Time.\n The word was #{@key}"
            true
        end
    end 
    def enter_guess(c)
        @guesses -=1
        if @key.include?(c)
            @guessed << c
            add_clue c
            puts "Correct Guess!"
        else 
            @guessed << c
            puts "Incorrect Guess!"

        end
    end

    def display
        print "Guessed letters:"
        @guessed.each {|guess| print guess+ " "}
        puts
        puts "Guesses remaining #{@guesses}"
        puts @key_clues
    end

    def add_clue(c)
        @key.split('').each_with_index do |v,i|
            @key_clues[i] = c if v == c
        end
    end

    def random_word
        dictionary = File.open('5desk.txt','r')
        words = []
        dictionary.readlines.each do |line|
            line = line.chomp           
            if line.length<=12 && line.length>=5
                 words << line
             end
            
        end
        dictionary.close
        secret_word =  words.sample
        # puts "random word is #{secret_word}"
        secret_word.downcase!
        secret_word
    end
    
end

game =  Game.new
game.game_menu


# @start = start_game until game_over? || start_game=='save'