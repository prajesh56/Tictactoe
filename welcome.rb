puts "Welcome to Tic Tac Toe"

class Game
    @board
    @position
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
        puts "choose position in board(1-9)"
        @position = gets.to_i
        @board[@position-1] = 'x'
        display_board
        puts "\nAI turn"
        ai_turn
        
    end

    def ai_turn
        @position = rand(1..9)
        if @board[@position] == " "
            @board[@position] = 'o'
        else
            ai_turn
        end
        display_board
    end
end

begin
game1 = Game.new
game1.display_board
game1.turn
end