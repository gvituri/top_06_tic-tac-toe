require_relative 'display.rb'
require_relative 'match.rb'
require_relative 'computer.rb'

module Tictactoe

    @@match = nil

    @@computer = nil
    @@player_one = nil
    @@player_two = nil

    @@board = nil

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

        @@board = Board.new
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
            puts "Start of Round!"

            9.times do
                move = nil
                puts @@board.print_board
                loop do
                    move = match_players[0].make_move
                    break if @@board.validate_move(move)
                end
                @@board.register_move(move, match_players[0].symbol)
                #test move against the board
                match_players = match_players.reverse()
            end
        end
    end

    def self.boot_game
        Display.welcome
        setup_game  
        start_match
    end
end