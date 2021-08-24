class Board
    attr_reader :board

    def initialize
        @board = reset_board
    end

    def display_board(board_to_display = @board)
        board_grid = [
            ["   A   B   C "],
            ["0  ", "(A0)", " | ", "(B0)", " | ", "(C0)", " "],
            ["  ---+---+---"],
            ["1  ", "(A1)", " | ", "(B1)", " | ", "(C1)", " "],
            ["  ---+---+---"],
            ["2  ", "(A2)", " | ", "(B2)", " | ", "(C2)", " "]
        ]

        i = 1
        j = 1

        board_to_display.each do |row|
            row.each do |space|
                board_grid[i][j] = space

                j += 2
            end

            board_grid[i] = board_grid[i].join
            j = 1
            i += 2
        end

        puts board_grid
        
    end

    def apply_move(player_move, player_symbol)
        input = treat_input(player_move)
        unless is_space_vacant?(input)
            return false
        end
        
        @board[input[0]][input[1]] = player_symbol

        return true        
    end

    def is_space_vacant?(input)
        return @board[input[0]][input[1]] == " "
    end

    def treat_input(raw_input)
        input = raw_input.sort!
        input[0] = input[0].to_i
        input[1] = input[1].downcase
        case input[1]
            when "a"
                input[1] = 0
            when "b"
                input[1] = 1
            when "c"
                input[1] = 2
        end
        return(input)
    end

    def check_for_win(played_symbol)
        draw_check = check_draw
        row_check = check_rows(played_symbol)
        column_check = check_columns(played_symbol)
        diagonal_check = check_diagonals(played_symbol)

        if row_check[0]
            return [true, "row", row_check[1]]
        elsif column_check[0]
            return [true, "column", column_check[1]]
        elsif diagonal_check[0]
            return [true, "diagonal", diagonal_check[1]]        
        elsif draw_check
            return [true, "draw", nil]
        end

        return [false, nil, nil]

    end

    def check_draw
        game_endend = false

        result = Hash.new(0)
        @board.each do |row|
            row.each do |space|
                result[space] += 1
            end
        end

        if result[" "] == 0
            game_endend = true
        end

        return(game_endend)

    end

    def check_rows(played_symbol)
        game_endend = false

        row_i = 0

        @board.each do |row|
            result = Hash.new(0)
            row.each do |space|
                result[space] += 1
                result
            end

            if result[played_symbol] == 3
                game_endend = true
                break
            end

            row_i += 1
        end

        return [game_endend, row_i]
    end

    def check_columns(played_symbol)
        game_endend = false

        column_i = 0

        3.times do
            result = Hash.new(0)
            @board.each do |row|
                result[row[column_i]] += 1
            end
    
            if result[played_symbol] == 3
                game_endend = true
                break
            end
    
            column_i += 1
        end    

        return [game_endend, column_i]
    end

    def check_diagonals(played_symbol)
        game_endend = false

        diagonal_i = 0
        diagonal_offset = 1
        
        2.times do
            result = Hash.new(0)
            @board.each do |row|
                result[row[diagonal_i]] += 1
                diagonal_i += diagonal_offset
            end
        
            if result[played_symbol] == 3
                game_endend = true
                break
            end
            diagonal_i = 2
            diagonal_offset = -1
        end
    
        return [game_endend, diagonal_offset]
    end

    def show_winning_board(winner, mode, iterator)
        crossed_board = []

        @board.each do |row|
            crossed_board << row.dup
        end

        case mode
            when "row"
                crossed_board[iterator] = ["-", "-", "-"]
            when "column"
                crossed_board[0][iterator] = "|"
                crossed_board[1][iterator] = "|"
                crossed_board[2][iterator] = "|"
            when "diagonal"
                line = ["\\", "/"]
                i = iterator < 0 ? 2 : 0
                crossed_board.each do |row|
                    row[i] = iterator < 0 ? line[1] : line[0]
                    i += iterator
                end
            when "draw"
                crossed_board = [
                    ["-", "-", "-"],
                    ["-", "-", "-"],
                    ["-", "-", "-"]
                ]
        end            

        5.times do
            system "clear"
            puts "#{winner} won the round!"
            display_board(@board)
            sleep(0.5)
            system "clear"
            puts "#{winner} won the round!"
            display_board(crossed_board)
            sleep(0.5)                        
        end
    end

    def reset_board
        @board = [
            [" ", " ", " "],
            [" ", " ", " "],
            [" ", " ", " "]
        ]
    end
end
=begin


=end