puts "Welcome to Tic Tac Toe"

class Game
    @board
    @position
    @user_position
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end
    
    def display_board
    puts row = ["#{@board[0]}" "|" "#{@board[1]}" "|" "#{@board[2]}"]
    puts separator = "------"
    puts row = ["#{@board[3]}" "|" "#{@board[4]}" "|" "#{@board[5]}"]
    puts separator = "------"
    puts row = ["#{@board[6]}" "|" "#{@board[7]}" "|" "#{@board[8]}"]
    end
    
    def turn
        loop do
        puts "choose valid position in board(1-9)"
        @position = gets.to_i
        @user_position = @position-1
        break if valid_position(@user_position)
        end
        @board[@user_position] = 'x'
        display_board
        
        puts "\n Ai turn"
        ai_turn   
    end

    def ai_turn
        
        loop do
            @position = rand(0..8)
            break if valid_position(@position) 
        end
        @board[@position] = 'o'
        
        display_board
    end

    def valid_position(pos)
        if @board[pos] == " "
            return true
        else
            return false
        end
    end

    def winning_position
        
    end
end

begin
game1 = Game.new
game1.display_board
game1.turn 
end