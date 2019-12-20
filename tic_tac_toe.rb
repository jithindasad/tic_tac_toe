class TicTacToe
    @@player_one_choice = "x"
    @@player_two_choice = "o"

    def initialize
        @player_one = nil
        @player_two = nil
        @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end

    def set_profile
        print "Enter Player One's Name: "
        @player_one = gets.chomp
        print "Enter Player Two's Name: "
        @player_two = gets.chomp
    end

    def display_board
       puts ""
       puts board_row_one = @board[0].join(" | ")
       puts "--+---+--"
       puts board_row_two = @board[1].join(" | ")
       puts "--+---+--"
       puts board_row_three = @board[2].join(" | ")
       puts ""
    end

    def play choice
        print "Enter the input: "
        input = gets.chomp.split(",")
        valid_input_arr = input.filter { |item| item.to_i <= 3 && item.to_i > 0 }
        while input.length != valid_input_arr.length
            puts "wrong format! Insert the entries in the form: x, y. (where x => row, y => column)"
            print "Enter the input: "
            input = gets.chomp.split(",")
            valid_input_arr = input.filter { |item| item.to_i <= 3 && item.to_i > 0 }
        end
        @board[(input[0].to_i) - 1][(input[1].to_i) - 1] = choice
        display_board
    end

    def start_game
        set_profile
        puts "Insert the entries in the form: x, y . where x => row, y => column"
        9.times do |item|
            if winning_conditions_met? && winning_conditions_met? != " "
                puts winner
                break
            end
            if item.even?
                puts "#{@player_one}'s turn "
                play @@player_one_choice
            elsif item.odd?
                puts "#{@player_two}'s turn "
                play @@player_two_choice
            end
        end
        puts "game over!"
    end

    def winning_conditions_met?
        #check for ideal columns & rows
        (0..2).each do |n|
            if @board[0][n] == @board[1][n] && @board[0][n] == @board[2][n]
                return @board[0][n]
            elsif @board[n][0] == @board[n][1] && @board[n][0] == @board[n][2]
                return @board[n][0]
            end
        end
        #check for ideal diagonals
        if (@board[0][0] == @board[1][1] && @board[0][0] == @board[2][2]) || (@board[2][0] == @board[1][1] && @board[2][0] == @board[0][2])
            return @board[1][1]
        end
    end

    def winner
        if winning_conditions_met? == "x"
            "#{@player_one} won!"
        elsif winning_conditions_met? == "o"
            "#{@player_two} won!"
        end
    end

end

p = TicTacToe.new
p.start_game
