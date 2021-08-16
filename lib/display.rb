require_relative 'dialogue.rb'
require_relative 'board.rb'
require_relative 'match.rb'

module Display

    def self.clear_display
        system "clear"
    end

    def self.welcome
        clear_display
        Dialogue.print_dialogue(:welcome)
    end

    def self.setup_match
        match_mode = Dialogue.print_dialogue(:setup_mode)
        if match_mode == "pvc"
        match_computer = Dialogue.print_dialogue(:setup_computer)
        end
        match_rounds  = Dialogue.print_dialogue(:setup_rounds)

        return Match.new(match_mode, match_computer, match_rounds)
    end

end
