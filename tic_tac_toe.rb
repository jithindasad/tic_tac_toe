class TicTacToe
    def initialize player_name, player_type
        @player_name = player_name
        @player_type = player_type
        @board_arr = [[" "," "," "],[" "," "," "], [" "," "," "]]
    end

    def generate_new_board
        @board_arr = [[" "," "," "],[" "," "," "], [" "," "," "]]
    end

    def display_board
        board_row_one = @board_arr[0].join(" | ")
        puts board_row_one
        puts "--+---+--"
        board_row_two = @board_arr[1].join(" | ")
        puts board_row_two
        puts "--+---+--"
        board_row_three = @board_arr[2].join(" | ")
        puts board_row_three
    end

    def game_over?
        return false
    end

    def p1_play
        puts "Player #{@player_name}'s turn"
        choice = gets.chomp.split(",")
        @board_arr[choice[0].to_i][choice[1].to_i] = @player_type
        p @board_arr[choice[0].to_i][choice[1].to_i]
        display_board
    end

end

p1 = TicTacToe.new("jithu", "x")
p2 = TicTacToe.new("ammu", "y")

p1.display_board
p1.p1_play
