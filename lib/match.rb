class Match

    attr_accessor :mode, :computer_level, :round_number

    def initialize(mode, computer_level, round_number)
        @mode = mode
        @computer_level = computer_level
        @round_number = round_number
    end
end