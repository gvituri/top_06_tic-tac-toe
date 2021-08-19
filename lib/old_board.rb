class Board

    attr_accessor :board

    def initialize
        @board = clear_board
    end

    def assemble_board(positions)

    end

    def clear_board
        return [
            ["   A   B   C "],
            ["0  ", " ", " | ", " ", " | ", " ", " "],
            ["  ---+---+---"],
            ["1  ", " ", " | ", " ", " | ", " ", " "],
            ["  ---+---+---"],
            ["2  ", " ", " | ", " ", " | ", " ", " "],
        ]
    end

    def print_board
        puts "\n"
        puts @board[0]
        puts @board[1].join
        puts @board[2]
        puts @board[3].join
        puts @board[4]
        puts @board[5].join
    end

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

