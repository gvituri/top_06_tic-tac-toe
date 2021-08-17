class Board

    @@board_header = "   A   B   C "
    @@board_divider = "  ---+---+---"

    def initialize
        @@board = build_board
    end

    def build_board
        board = []
        board << @@board_header

    end




end

board = [
    "0  A0 | B0 | C0 ",
    "1  A1 | B1 | C1 ",
    "2  A2 | B2 | C2 "
]

