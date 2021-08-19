require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'match.rb'

module Game
    def self.boot_game
        match = Match.new
        player = Player.new
        computer = Computer.new
    end

end

