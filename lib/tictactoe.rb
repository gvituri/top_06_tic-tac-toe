require_relative 'display.rb'
require_relative 'match.rb'
require_relative 'computer.rb'

module Tictactoe

    @@match = nil

    @@computer = nil
    @@player_one = nil
    @@player_two = nil

    def self.setup_game
        
        @@match = Display.setup_match

        
        puts "\nSetting up Player 1."
        @@player_one = Display.setup_player

        @@match.pick_computer_symbol(@@player_one)
        @@computer = Computer.new(@@match.computer_symbol, @@match.computer_level)

        unless @@match.mode == "pvc"
            puts "\nSetting up Player 2."
            puts "Make sure name and symbol do no match with Player's one."
            @@player_two = Display.setup_player(@@player_one.name, @@player_one.symbol)
        end
    end

    def self.change_setup

    end

    def self.start_match
        match_players = []
        if @@match.mode == "pvp"
            match_players << @@player_one
            match_players << @@player_two
        else
            match_players << @@player_one
            match_players << @@computer
        end

        @@match.round_number.times do
            Display.clear_display
            puts "\n Start of Round!"

            9.times do
                puts "#{match_players[0].name}'s Turn"
                match_players[0].make_move
                match_players = match_players.reverse()
            end
        end

        #loop rounds match.rounds.times
            #chooses starting player:
                #not sure how to do it yet
                #make a pool of player 1 + (player 2 OR computer)
                #pick random
            #loop of the game it-self
                #display board
                #ask curent player for move
                    #check if input is valid
                #check if move is valid
                #change board to add the move
                #check if move wins the game
            #end

        #end

        #ask if remach
            #if no
                #return
            #if yes
                #ask if change setup?
                    #if no
                        #start.match
                    #if yes
                        #change_setup
                        #start.match
    end

    def self.boot_game
        Display.welcome
        setup_game  
        start_match
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