class Player

    attr_accessor :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

end

module Dialogue

    def self.welcome
        puts "Welcome!"
        sleep(1)
        puts "To the hardest game of all time!"
        sleep(1)
        print "."
        sleep(1)
        print "."
        sleep(1)
        puts "."
        print "TIC "
        sleep(1)
        print "TAC "
        sleep(1)
        puts "TOE!"
        sleep(1)
    end

    def self.game_mode
        puts "\nPlease, select a game mode by typing pvp or pvc!"
        puts "pvp - Player vs Player"
        puts "pvc - Player vs Computer"
        return gets.chomp
    end

    def self.computer_level
        puts "\nPlease, select the computer level by typing easy, medium, hard!"
        return gets.chomp
    end

    def self.config_player_one
        puts "Insert player one's name: "
        name = gets.chomp
        puts "Now please insert players one's character: "
        symble = gets.chomp
        return Player.new(name, symble)
    end

    def self.config_player_two
        puts "Insert player two's name: "
        name = gets.chomp
        puts "Now please insert players two's character: "
        symble = gets.chomp
        return Player.new(name, symble)
    end

    def self.rounds_number
        puts "Lastly, input the number of rounds, from 1 to 10!"
        return gets.chomp.to_i
    end
end
module Game
    
    @@match_mode = nil
    @@computer_level = nil

    @@player_one = nil
    @@player_two = nil
        
    @@rounds = nil

    def self.boot_game
        system "clear"
        Dialogue.welcome
        @@match_mode = Dialogue.game_mode
        @@player_one = Dialogue.config_player_one
        if @@match_mode == "pvc"
            @@computer_level = Dialogue.computer_level
        else
            @@player_two = Dialogue.config_player_two
        end
        @@rounds = Dialogue.rounds_number
    end
end

board = [
    "   A   B   C ",
    "0  - | - | - ",
    "  ---+---+---",
    "1  - | - | - ",
    "  ---+---+---",
    "2  - | - | - "
]

Game.boot_game
