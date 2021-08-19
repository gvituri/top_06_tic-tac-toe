require_relative 'require_input.rb'
require_relative 'check_input.rb'

class Player
    include RequireInput
    include CheckInput
    attr_accessor :name, :symbol

    @@input_player = {
        require_name: [
            "long",
            "Enter your name(10 characters max).",
            ["empty"],
            "ERROR - Input is too long.."
        ],
        require_symbol: [
            "symbol",
            "Enter your symbol(1 character only)",
            ["empty"],
            "ERROR - Input is not valid."
        ],
    }

    def initialize
        @name = self.require_input(@@input_player[:require_name])
        @symbol = self.require_input(@@input_player[:require_symbol])
    end

    def make_move
        #makes move
    end
end