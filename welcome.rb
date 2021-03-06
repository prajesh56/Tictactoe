class Game
    @board
    @mode
    @position
    @user_position
    @winner
    def initialize(mode)
        @board = [" "," "," "," "," "," "," "," "," "]
        @mode = mode
    end
    
    def display_board
    puts row = ["#{@board[0]}" "|" "#{@board[1]}" "|" "#{@board[2]}"]
    puts separator = "------"
    puts row = ["#{@board[3]}" "|" "#{@board[4]}" "|" "#{@board[5]}"]
    puts separator = "------"
    puts row = ["#{@board[6]}" "|" "#{@board[7]}" "|" "#{@board[8]}"]
    end
    
    def turn
        loop do #to check if position is valid
        puts "Player 1: choose valid position in board(1-9)"
        @position = gets.to_i
        @user_position = @position-1
        break if valid_position(@user_position)
        end

        @board[@user_position] = 'x'
        display_board
        
        if winning_case(@board)
            puts "\nPlayer1 is winner"
        else
            if @mode == 1
                if game_over(@board)
                    puts "\nGame over, No player is winner."
                else
                    puts "\n Ai turn"
                    ai_turn
                end
            elsif @mode ==2
                if game_over(@board)
                    puts "\nGame over, No player is winner."
                else
                puts "\n Player2 turn"
                turn2
                end
            end
        end
    end

    def turn2
        loop do #to check if position is valid
        puts "Player 2:choose valid position in board(1-9)"
        @position = gets.to_i
        @user_position = @position-1
        break if valid_position(@user_position)
        end
        
        @board[@user_position] = 'o'
        display_board
        
        if winning_case(@board)
            puts "\nPlayer2 is winner"
        else
            if game_over(@board)
                puts "\nGame over, No player is winner."
            else
                puts "\n Player1 Turn"
                turn
            end
        end
    end

    def ai_turn
        
        loop do
            @position = rand(0..8)
            break if valid_position(@position) 
        end
        @board[@position] = 'o'
        
        display_board
        
        if winning_case(@board)
            puts "\nAi is winner"
        else
            if game_over(@board)
                puts "\nGame over, No player is winner."
            else
                puts "\n Your turn"
                turn
            end
        end
    end

    def valid_position(pos)
        if @board[pos] == " "
            return true
        else
            return false
        end
    end

    def winning_case(arr)
    #rowwise winner
        if arr[0]=='x' && arr[1]=='x' && arr[2]=='x'
            true
        elsif arr[0]=='o' && arr[1]=='o' && arr[2]=='o'
            true
        elsif arr[3]=='x' && arr[4]=='x' && arr[5]=='x'
            true
        elsif arr[3]=='o' && arr[4]=='o' && arr[5]=='o'
            true
        elsif arr[6]=='x' && arr[7]=='x' && arr[8]=='x'
            true
        elsif arr[6]=='o' && arr[7]=='o' && arr[8]=='o'
            true
    #columnwise winner
        elsif arr[0]=='x' && arr[3]=='x' && arr[6]=='x'
            true
        elsif arr[0]=='o' && arr[3]=='o' && arr[6]=='o'
            true
        elsif arr[1]=='x' && arr[4]=='x' && arr[7]=='x'
            true
        elsif arr[1]=='o' && arr[4]=='o' && arr[7]=='o'
            true
        elsif arr[2]=='x' && arr[5]=='x' && arr[8]=='x'
            true
        elsif arr[2]=='o' && arr[5]=='o' && arr[8]=='o'
            true
    #diagonalwise winner
        elsif arr[0]=='x' && arr[4]=='x' && arr[8]=='x'
            true
        elsif arr[0]=='o' && arr[4]=='o' && arr[8]=='o'
            true
        elsif arr[2]=='x' && arr[4]=='x' && arr[6]=='x'
            true
        elsif arr[2]=='o' && arr[4]=='o' && arr[6]=='o'
            true
        else
            false
        end
    end

    def game_over(board)
        counter = 0
        board.each do |a|
          if a == " "
              counter+=1
          end
        end
        if counter == 0
            return true
        else
            return false
        end
    end
end

begin
    puts "Welcome to Tic Tac Toe Game"
    puts "---------------------------"
    puts "Choose the gaming mode"
    puts "1. Single-player"
    puts "2. Multi-player"
    mode = gets.to_i
    if mode == 1 || mode ==2
        game1 = Game.new(mode)
        game1.display_board
        who_play_first = rand(1..2) #choosing who plays first strike
       
        if who_play_first ==1
            puts "Player1 goes first"
            game1.turn 
        elsif who_play_first == 2
           if mode == 1
                puts "Ai goes first"
                game1.ai_turn
           elsif mode == 2
                puts "Player 2 goes first"
                game1.turn2
           end
        end
    else
        puts "Error Invalid input"
    end


end