require_relative 'display.rb'
require_relative 'match.rb'

module Tictactoe

    @@match = nil

    @@player_one = nil
    @@player_two = nil

    def self.setup_game
        @@match = Display.setup_match
        puts "gets player one name and symbol"
        puts "gets player two name and symble"

        p @@match.mode
        p @@match.computer_level
        p @@match.round_number
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