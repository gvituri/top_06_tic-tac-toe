require_relative 'dialogue.rb'
require_relative 'board.rb'
require_relative 'match.rb'

module Display

    def self.clear_display
        system "clear"
    end

    def self.welcome
        clear_display
        Dialogue.welcome
    end

    def self.setup_match
        clear_display
        match_mode = Dialogue.setup_match_mode
        clear_display
        puts "Mode: #{match_mode}"
        if match_mode == "pvc"
            computer_dificulty = Dialogue.setup_computer
        end
        clear_display
        puts "Mode: #{match_mode}"
        if match_mode == "pvc" 
        puts "Computer dificulty: #{computer_dificulty}" 
        end
        round_number = Dialogue.setup_rounds

        return Match.new(match_mode, computer_dificulty, round_number)
    end

end

