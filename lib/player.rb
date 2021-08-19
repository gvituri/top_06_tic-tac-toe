require_relative 'input_check.rb'

class Player
    include InputCheck
    attr_accessor :name, :symbol

    def initialize
        @name = setup_name
        @symbol = setpup_symbol
    end

    def setup_name
        self.input_check
        return "name"
    end

    def setpup_symbol
        self.input_check
        return "symbol"
    end

    def make_move
        #makes move
    end
end