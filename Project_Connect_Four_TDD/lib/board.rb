class Board    
  attr_accessor :grid
  
  def initialize
      @grid = make_grid
  end
  
  def make_grid
      grid=[]
      6.times do 
          grid.push(Array.new(7,' '))
      end
      grid
  end
  def display
      #   puts "grid #{grid}"
          i = 0
          # p i
          puts `clear`
          # puts "B: #{grid.size}"
          # puts "B[0]: #{grid[0].size}"
          until i>=grid.size do 
              puts "|#{disp(grid[i])}|" 
          i+=1
          end
          puts "---------------"
          puts "|1|2|3|4|5|6|7|"
          puts "---------------"
        #  grid.map{|g| p g}
          
      end
  def disp(row)
          row.join("|")
  end
  def move(piece,input)
      input-=1
      height = grid.size - 1
      until grid[height][input] == ' ' do
          height-=1
          raise "Column full, Try another column" if height< 0
      end
      grid[height][input]=piece
      # p grid
  end

  def board_full?(grid)
    
      grid.map {
        |g| 
          g.map {
             |e|
              # p "e is #{e}"
              
              return false if e ==' '
          }
      }
    true
  end

  def horizontal(piece)
    result = ""
    # grid = @grid.transpose
    grid.each do |element|
      result = element.join("")
       return true if result_check(piece,result)
    end
     return false
  end


  def vertical(piece)
    result = ""
    grid = @grid.transpose
    grid.each do |element|
      result = element.join("")
      # p result
      return true if result_check(piece,result)
    end
    return false
  end

  def result_check(piece,result)
     if piece == "X"
        if result.include?("XXXX") 
          p "Player 1 is the Winner!"
          return true
        elsif result.include?("OOOO")
          p "Player 2 is the Winner!"
          return true
        end
      else 
        if result.include?("OOOO")
          p "Player 1 is the Winner"
          return true
        elsif result.include?("XXXX")
          p "Player 2 is the Winner!"
          return true
        end
      end
      return false
  end
    def diagonal(piece)
      make_right_arr(piece)
      # return true if result_check(piece,result)
    end

    def make_diag_top_left(grid,column_size,row_size,res_diag_arr)
      # p grid
    end

    def make_right_arr(piece)
      grid = @grid.transpose
      column_size = grid.size-1
      row_size = grid[0].size-1
      # print("row size is #{row_size}
      # col size: #{column_size} \n")
      
      res_diag_arr_top_right = []
      res_diag_arr_top_right = make_diag_top_right(grid,column_size,row_size,res_diag_arr_top_right)
      # res_diag_arr_top_right=res_diag_arr_top_right.join("")

      # p res_diag_arr_top_right
      res_diag_arr_top_right.map{
        |e|
        e = e.join
        return true if result_check(piece,e)
      }
      
      

      res_diag_arr_bottom_right=[]
      res_diag_arr_bottom_right = make_diag_bottom_right(grid,column_size,row_size,res_diag_arr_bottom_right)
      # res_diag_arr_bottom_right=res_diag_arr_bottom_right.join("")
      # return true if result_check(piece,res_diag_arr_bottom_right)
      res_diag_arr_bottom_right.map{
        |e|
        # p " e is #{e}"
        e = e.join
        return true if result_check(piece,e)
      }
      return false
    end

      def make_diag_top_right(grid,column_size,row_size,res_diag_arr)
        for i in 0..row_size
          res = []
          for j in 0..column_size
            # p grid[j][i+j]
            res.push(grid[j][i+j])
          end
          res.compact!
          # res =res.join("")
          # p "Res is #{res}"
          res_diag_arr.push(res) if res.size>3
        end
        res_diag_arr
      end

      def make_diag_bottom_right(grid,column_size,row_size,res_diag_arr)
        grid=grid.transpose
        # grid.map{|g| p g}
        
        for i in row_size.downto(0)
            res = []
          for j in 0..column_size
        begin 
            res.push(grid[j][i-j])
            # p "grid[j][i-j] #{grid[j][i-j]}"
        rescue NoMethodError
          next
        end
          end
          res.compact!
          # res = res.join("")
          # p "Res is #{res}"
          res_diag_arr.push(res) if res.size>3
        end
        res_diag_arr
      end
            
end
