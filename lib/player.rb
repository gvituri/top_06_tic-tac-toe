class Player

    attr_accessor :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def make_move
        puts "Asks for #{@name} move"
    end

end