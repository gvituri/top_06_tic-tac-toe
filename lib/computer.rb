require_relative 'input_check.rb'

class Computer < Player
    include InputCheck
    attr_accessor :name, :symbol, :level

    def initialize
        super
        @level = setpup_level
    end

    def setup_name      
        self.input_check
        return "computer_name"
    end

    def setpup_symbol
        self.input_check
        return "computer_symbol"
    end

    def setpup_level
        self.input_check
        return "computer_level"
    end

    def make_move
        #makes move
    end
end