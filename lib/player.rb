require_relative 'require_input.rb'
require_relative 'check_input.rb'

class Player
    include RequireInput
    include CheckInput
    attr_accessor :name, :symbol

    @@number_of_players = 0
    @@players = {}

    @@input_player = {
        require_name: [
            "long",
            "Enter your name(10 characters max).",
            ["empty"],
            "ERROR - Input is too long.."
        ],
        require_symbol: [
            "symbol",
            "Enter your symbol(1 character only).",
            ["empty"],
            "ERROR - Input is not valid."
        ],
    }

    def initialize
        @name = setup_name
        @symbol = setup_symbol

        @@number_of_players += 1
        @@players["player#{@@number_of_players.to_s}".to_sym] = [@name, @symbol]
    end

    def setup_name
        puts "Player #{(@@number_of_players + 1).to_s}"
        begin
            player_name = self.require_input(@@input_player[:require_name])
            unless @@players.empty? 
                raise "ERROR - Name in use." if player_name == @@players[:player1][0]
            end
        rescue => e
            puts e
            retry
        end

        return player_name
    end

    def setup_symbol
        begin
            player_symbol = self.require_input(@@input_player[:require_symbol])
            unless @@players.empty? 
                raise "ERROR - Symbol in use." if player_symbol == @@players[:player1][1]
            end
        rescue => e
            puts e
            retry
        end

        return player_symbol
    end

    def make_move
        puts "#{self.name} makes a move."
    end

    def self.clear_players
        @@players = {}
        @@number_of_players = 0
    end
end

=begin
    def make_move
        move_input = nil

        puts "#{@name} it is your turn."
        puts "Please, state the coordinate of your move (ex: a2, C0)."
        loop do
            move_input = gets.chomp.downcase.split("")

            unless move_input.length == 2
                puts "Invalid coordinate."
                puts "Try again.\n"
                next
            end
            
            valid_x = move_input[0]
            valid_y = move_input[1]
            break if (valid_x.ord.between?(97, 99) && valid_y.ord.between?(48, 50))
            puts "Invalid coordinate."
            puts "Try again.\n"
        end

        return move_input
    end
=end
