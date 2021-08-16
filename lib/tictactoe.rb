require_relative 'display.rb'
require_relative 'match.rb'

module Tictactoe

    @@match = nil

    @@player_one = nil
    @@player_two = nil

    def self.setup_game
        
        @@match = Display.setup_match
        
        puts "\nSetting up Player 1."
        @@player_one = Display.setup_player

        @@match.pick_computer_symbol(@@player_one)

        unless @@match.mode == "pvc"
            puts "\nSetting up Player 2."
            puts "Make sure name and symbol do no match with Player's one."
            @@player_two = Display.setup_player(@@player_one.name, @@player_one.symbol)
        end
    end

    def self.start_match
        puts "start match"
        puts "start round"
    end

    def self.start_game
        setup_game  
        start_match
    end

    def self.boot_game
        Display.welcome
        start_game
    end
end

=begin
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
=end