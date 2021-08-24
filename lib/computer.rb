require_relative 'require_input.rb'
require_relative 'check_input.rb'

class Computer < Player
    include RequireInput
    include CheckInput
    attr_accessor :name, :symbol

    def initialize
        super
        @@players["computer"] = [@name, @symbol]
    end

    def setup_name      
        name_options = ["Optimus", "R2-D2", "C-3PO", "B-9", "Marvin", "Robby, the Robot",
        "WALL-E", "Iron Giant", "Terminator", "Ultron", "Mars Rover", "Bender"]

        begin
            computer_name = name_options.sample
            unless @@players.empty? 
                raise if computer_name == @@players[:player1][0]
            end
        rescue
            retry
        end

        return computer_name
    end

    def setup_symbol
        symbol_array = ["X", "O"]
        symbol_array.each do |symbol|
            return symbol unless symbol == @@players[:player1][1]
        end
    end

    def make_move
        columns = ["a", "b", "c"]
        rows = ["0", "1", "2"] 

        return [columns.sample, rows.sample]
    end

end

