class Player

    attr_accessor :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def make_move
        move_input = nil

        puts "\n#{@name} it is your turn."
        puts "Please, state the coordinate of your move (ex: a2, C0)."
        loop do
            move_input = gets.chomp.split("")

            unless move_input.length == 2
                puts "Invalid coordinate."
                puts "Try again.\n"
                next
            end
            
            valid_x = move_input[0]
            valid_y = move_input[1]
            break if (valid_x.ord.between?(65, 67) || valid_x.ord.between?(97, 99)) && (valid_y.ord.between?(48, 50))
            puts "Invalid coordinate."
            puts "Try again.\n"
        end

        return move_input
    end

end