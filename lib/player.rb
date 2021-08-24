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
        require_move: [
            "move",
            "Enter your move(ex: a1, B2, 2c, 0A).",
            ["empty"],
            "ERROR - Input is not valid."            
        ]
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
        puts "#{self.name}, it is your turn."
        return self.require_input(@@input_player[:require_move]).split("")
    end

    def self.clear_players
        @@players = {}
        @@number_of_players = 0
    end
end
