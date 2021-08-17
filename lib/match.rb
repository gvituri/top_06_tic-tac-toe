require_relative 'tictactoe.rb'
require_relative 'computer.rb'
class Match

    attr_accessor :mode, :computer_level, :computer_symbol, :round_number

    def initialize(mode, computer_level, round_number)
        @mode = mode
        @computer_level = computer_level
        @computer_symbol = nil
        @round_number = round_number.to_i
    end

    def pick_computer_symbol(player_one)
        symbol_array = ["X", "O"]
        symbol_array.each do |symbol|
            @computer_symbol = symbol unless symbol == player_one.symbol
        end
    end
end