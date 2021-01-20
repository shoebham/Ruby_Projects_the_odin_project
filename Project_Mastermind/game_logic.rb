

module GameLogic
  def compare(answer,guess)
    temp_answer = answer.clone
    temp_guess = guess.clone
    @exact_num = exact_compare(temp_answer,temp_guess)
    @same_num =  same_compare(temp_answer,temp_guess)
    @total_number = exact_num+same_num
   
  end

  def exact_compare(answer,guess)
  exact = 0
    answer.each_with_index do |i,j|
      next unless i == guess[j]
      exact+=1
      answer[j]="O"
      guess[j]="O"
    end
    exact
  end

  def same_compare(answer,guess)
    same=0
      guess.each_index do |i|
      next unless guess[i]!="O" && answer.include?(guess[i])
      same+=1
      remove = answer.find_index(guess[i])
      answer[remove] = "X"
      guess[i] = "X"
    end
    # puts "answer in same_compare #{answer}"
    # puts "guess in same_compare #{guess}"
    same
  end

  def solved?(answer,guess)
   answer==guess
  end

  def show_clues(exact,same)
    exact.times {print "O"}
    same.times {print "X"}
    puts ""
    # puts "exact is #{exact_num}"
    # puts "Same is #{same_num}"
  end
end