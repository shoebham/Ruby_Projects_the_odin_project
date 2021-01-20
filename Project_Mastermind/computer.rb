require_relative "game_logic.rb"
class Code_maker

 
  include GameLogic
  
  attr_accessor :all_possible_code, :code_space, :code, :exact_num , :same_num , :player_code
  def initialize
    puts `clear`
    puts "Loading"
    @code_space = []
    @all_possible_code = create_all_code
    @code = code_space.sample
    @player_code = player_input
  end
  
  def create_all_code
     return if code_space.size == 1296
     number = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)].join("")
     code_space.push(number)
     code_space.uniq!
    #  puts "code_space size is #{code_space.size}"
     create_all_code
  end

  def eliminate_code(guess,exact,same)
    code_space.select! do |e|
      compare(e.split(""),guess.split(""))
      (exact== exact_num && same == same_num)
    end
  end
  def play
    puts "Computer broke your code!!" if start
  end

  def start
    puts "----------"
    turn = 1
    initial_guess = "1122"
    compare(player_code.split(""),initial_guess.split(""))
    puts initial_guess
    show_clues(exact_num,same_num)
    puts "Code Broken" if solved?(player_code,initial_guess)
    eliminate_code(initial_guess,exact_num,same_num)
    11.times do 
      puts "Chances left: - #{10-turn}"
      puts "----------"
      turn+=1
      sleep(1)
      guess = code_space.sample
      puts guess
      compare(player_code.split(""),guess.split(""))
      show_clues(exact_num,same_num)
      return true if solved?(player_code,guess)
      eliminate_code(guess,exact_num,same_num)
    end
  end


  def player_input
    puts `clear`
    puts "Enter your code"
    input = gets.chomp!
    return input if input.match(/^[1-6]{4}$/)
    puts "your guess can only be of 4 digits and between 1-6"
    player_input
  end
end