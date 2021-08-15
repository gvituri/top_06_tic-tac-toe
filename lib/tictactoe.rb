require_relative 'display.rb'

module Tictactoe

    @@match_mode = nil
    @@rounds = nil
    @@computer_level = nil

    @@player_one = nil
    @@player_two = nil

    def self.setup_game
        puts "game setup"
        puts "gets type of match"
        puts "gets computer dificulty if PVC"
        puts "gets number of rounds"
        puts "gets player one name and symbol"
        puts "gets player two name and symble"
    end

    def self.start_match
        puts "start match"
        puts "start round"
    end

    def self.start_game_loop
        
        change_setup = true
        
        if change_setup
            setup_game
        end
        
        start_match
        
    end

    def self.boot_game
        Display.welcome
        start_game_loop
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