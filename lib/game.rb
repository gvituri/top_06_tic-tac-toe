require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'match.rb'

module Game

    @@match_players = []

    def self.boot_game
        match = Match.new
        player1 = Player.new
        @@match_players << player1

        if match.mode == "pvc"
            computer = Computer.new
            @@match_players << computer
        else
            player2 = Player.new
            @@match_players << player2
        end

        match.start_match(@@match_players)
    end
end

