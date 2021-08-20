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
            @@match_players << player1
            player2 = Player.new
        end

        match.start_match(@@match_players)
    end
end

