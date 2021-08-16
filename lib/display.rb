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

    def self.setup_player
        player_name = Dialogue.print_dialogue(:setup_player_name)
        player_symbol = Dialogue.print_dialogue(:setup_player_symbol)
        return Player.new(player_name, player_symbol)
    end

end
