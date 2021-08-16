require_relative 'dialogue.rb'
require_relative 'board.rb'
require_relative 'match.rb'
require_relative 'player.rb'

module Display

    def self.clear_display
        system "clear"
    end

    def self.welcome
        clear_display
        Dialogue.print_dialogue(:welcome)
    end

    def self.setup_match
        clear_display
        match_mode = Dialogue.print_dialogue(:setup_mode)
        if match_mode == "pvc"
        match_computer = Dialogue.print_dialogue(:setup_computer)
        end
        match_rounds  = Dialogue.print_dialogue(:setup_rounds)

        return Match.new(match_mode, match_computer, match_rounds)
    end

    def self.setup_player(existing_name = nil, existing_symbol = nil)
        player_name = nil
        player_symbol = nil

        loop do
            player_name = Dialogue.print_dialogue(:setup_player_name)
            break unless player_name == existing_name
        end
        loop do
            loop do
                player_symbol = Dialogue.print_dialogue(:setup_player_symbol)
                break if player_symbol.length == 1
            end
            break unless player_symbol == existing_symbol
        end

        return Player.new(player_name, player_symbol)

    end

end