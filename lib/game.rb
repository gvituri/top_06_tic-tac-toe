require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'match.rb'

module Game
    def self.boot_game
        match = Match.new
        player1 = Player.new
        player2 = Player.new
        computer = Computer.new

        p match.mode
        p match.round_number

        p player1.name
        p player1.symbol

        p player2.name
        p player2.symbol

        p computer.name
        p computer.symbol
        p computer.level
    end

end

