require 'pry'
class  TicTacToe
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[4,7,1],[2,5,8],[0,4,8],[6,4,2]]
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]     #initialize when new game is created
    
  end
  
  def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "  #board display 
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
         
  end
  
  def input_to_index(index)
      index.to_i - 1                                               #input from users
      #bi1nding.pry

  end
                                            #  location = 0     token = x
                                            
    def move(location, token="X")        #      move( 0 , O )            
    @board[location] = token
    #binding.pry
  end
  
    def position_taken?(location)   #postion is not empty 
       @board[location]=="X" || @board[location]=="O"
       
    end
     def valid_move?(index)
       !position_taken?(index) && index.between?(0,8) #if postion is not taking and board size between range of 0 to 8 than input from users  is a valide move 
       #binding.pry
       
     end
     def turn_count
        @board.count {|player| player == "X" || player == "O"} #this is going to return amount of time X and O exist 
        #binding.pry
     end
     def current_player   #return correct player X for the third move 
         turn_count % 2 == 0 ? "X" : "O"
     end
    def turn
        input = gets.strip               #The placement of X on board 
        index = input_to_index(input)
        if valid_move?(index)   
          move(index,current_player)                               #if valide_move is true then i can move to play game
        else
          turn 
        end
        display_board 
    end
    
     def won?
        combo = false
         WIN_COMBINATIONS.each do |array|
            if position_taken?(array[0]) && @board[array[0]] == @board[array[1]] && @board[array[1]] == @board[array[2]] 
               binding.pry
              combo = array
              return combo
            end
         end
         combo
     end
     def full?  #method want me to return true for draw 
       
     end
  end