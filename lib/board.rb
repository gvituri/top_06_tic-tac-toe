class Board
    attr_reader :name, :symbol, :level

    def initialize
        @board = [
            [" ", " ", " "],
            [" ", " ", " "],
            [" ", " ", " "]
        ]
    end

    def display_board
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

        @board.each do |row|
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

        game_endend = false

        #check rows

        row_i = 0

        @board.each do |row|
            result = Hash.new(0)
            row.each do |space|
                result[space] += 1
                result
            end

            if result[played_symbol] == 3
                game_endend = true
                puts "game has ended in row #{row_i}"
                break
            end

            row_i += 1
        end
        #check colomns

        col_i = 0

        3.times do
            result = Hash.new(0)
            @board.each do |row|
                result[row[col_i]] += 1
            end

            if result[played_symbol] == 3
                game_endend = true
                puts "game has ended in row #{col_i}"
                break
            end

            col_i += 1
        end

        #check diagonals

        diag_i = 0
        diag_offset = 1

        2.times do
            result = Hash.new(0)
            @board.each do |row|
                result[row[diag_i]] += 1
                diag_i += diag_offset
            end

            if result[played_symbol] == 3
                game_endend = true
                puts "game has ended in a diagonal"
                break
            end

            diag_offset = -1
        end

        return game_endend
    end
end