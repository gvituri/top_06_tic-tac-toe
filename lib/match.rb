require_relative 'require_input.rb'
require_relative 'check_input.rb'

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
        @round_number = self.require_input(@@input_match[:require_round])
        @scores = setup_scores
    end

    def setup_scores
        return {p1: 0, p2: 0}
    end
end