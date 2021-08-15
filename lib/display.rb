require_relative 'dialogue.rb'
require_relative 'board.rb'

module Display

    def self.clear_display
        system "clear"
    end

    def self.welcome
        clear_display
        Dialogue.welcome
    end

end