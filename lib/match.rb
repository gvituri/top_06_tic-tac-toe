require_relative 'require_input.rb'
require_relative 'check_input.rb'
require_relative 'board.rb'

class Match
    include RequireInput
    include CheckInput
    attr_accessor :mode, :round_number, :scores

    @@input_match = {
        require_mode: [
            "dictionary",
            "pvp (player vs player) or pvc (player vs computer)?",
            ["pvp", "pvc"],
            "ERROR - Input has no match."
        ],
        require_round: [
            "integer",
            "number of rounds(1,2,3...)? ",
            ["empty"],
            "ERROR - Input is not a positive integer."
        ],
    }

    def initialize
        @mode = self.require_input(@@input_match[:require_mode])
        @round_number = self.require_input(@@input_match[:require_round]).to_i
        @score = {}
    end

    def setup_scores(match_players)
        match_players.each do |player|
            @score[player.name.to_sym] = 0
        end
    end

    def start_match(match_players)
        setup_scores(match_players)
        board = Board.new

        round_iterator = 1

        self.round_number.times do
            puts "Round #{round_iterator.to_s}."
            9.times do
                board.display_board
                match_players[0].make_move
                match_players = match_players.reverse()
            end
            round_iterator += 1
        end
    end
end