class Computer
    attr_accessor :name, :symbol, :level

    def initialize(symbol, level)
        @name = randomize_name
        @symbol = symbol
        @level = level
    end

    def randomize_name
        name_dictionary = ["Optimus", "R2-D2", "C-3PO", "B-9", "Marvin", "Robby, the Robot",
        "WALL-E", "Iron Giant", "Terminator", "Ultron", "Mars Rover", "Bender"]
        return name_dictionary.sample
    end

    def make_move
        puts "Asks for #{@name} move"
    end
end