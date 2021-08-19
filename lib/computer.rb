require_relative 'require_input.rb'
require_relative 'check_input.rb'

class Computer < Player
    include RequireInput
    include CheckInput
    attr_accessor :name, :symbol, :level

    @@input_computer = {
        require_level: [
            "dictionary",
            "Computer level: easy, medium or hard?.",
            ["easy", "medium", "hard"],
            "ERROR - Input has no match."
        ],
    }

    def initialize
        @name = setup_name
        @symbol = setup_symbol
        @level = self.require_input(@@input_computer[:require_level])
    end

    def setup_name      
        name_options = ["Optimus", "R2-D2", "C-3PO", "B-9", "Marvin", "Robby, the Robot",
        "WALL-E", "Iron Giant", "Terminator", "Ultron", "Mars Rover", "Bender"]
        return name_dictionary.sample
    end

    def setup_symbol
        return "computer_symbol"
    end

    def make_move
        #makes move
    end
end