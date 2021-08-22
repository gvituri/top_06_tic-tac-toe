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
        input.reverse!
        case input[0]
            when "a"
                input[0] = 0
            when "b"
                input[0] = 1
            when "c"
                input[0] = 2
        end
        return(input)
    end
end

=begin
class Board

    def validate_move(move)
        current_board = current_board_coordinates
        move = convert_move(move)

        if current_board[move[0]][move[1].to_i] == " "
            return true
        else
            puts "Invalid move."
            puts "Please try again:"
            return false
        end
    end

    def register_move(move, player_symbol)
        current_board = current_board_coordinates
        move = convert_move(move)
        #TODO MAKE THE ALTERATION ON THE BOARD TO DISPLAY THE MOVE
    end

    def convert_move(move)
        case move[0]
            when "a"
                move[0] = 0
            when "b"
                move[0] = 1
            else
                move[0] = 2
        end

        return move

    end

    def current_board_coordinates
        coordinates = []
        coordinates << [@board[1][1], @board[1][3], @board[1][5]]

        coordinates << [@board[3][1], @board[3][3], @board[3][5]]

        coordinates << [@board[5][1], @board[5][3], @board[5][5]]

        return coordinates
    end

end

#positions
    #board[1][1] = A0,[1][3] = B0, [1][5] = C0
    #board[3][1] = A1,[3][3] = B1, [3][5] = C1
    #board[5][1] = A2,[5][3] = B2, [5][5] = C2

=end