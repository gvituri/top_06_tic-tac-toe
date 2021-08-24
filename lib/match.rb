require_relative 'require_input.rb'
require_relative 'check_input.rb'
require_relative 'board.rb'

class Match
    include RequireInput
    include CheckInput
    attr_accessor :mode, :round_number, :scores

    @@input_match = {
        require_mode: [
            "dictionary",
            "pvp (player vs player) or pvc (player vs computer)?",
            ["pvp", "pvc"],
            "ERROR - Input has no match."
        ],
        require_round: [
            "integer",
            "number of rounds(1,2,3...)? ",
            ["empty"],
            "ERROR - Input is not a positive integer."
        ],
        require_rematch: [
            "dictionary",
            "Rematch?(yes or no)",
            ["yes", "y", "no", "n"],
            "Error - Input has no match."
        ]
    }

    def initialize
        @mode = self.require_input(@@input_match[:require_mode])
        @round_number = self.require_input(@@input_match[:require_round]).to_i
        @score = {}
    end

    def setup_scores(match_players)
        match_players.each do |player|
            @score[player.name.to_sym] = 0
        end
    end

    def start_match(match_players)
        system "clear"
        setup_scores(match_players)
        board = Board.new

        round_iterator = 1

        self.round_number.times do
            system "clear"
            match_players = pick_first_player(match_players)
            round_winner = nil
            winning_mode = nil
            mode_iterator = nil

            loop do
                system "clear"
                puts "Round #{round_iterator.to_s}\n"
                board.display_board

                begin
                    move = match_players[0].make_move

                    unless board.apply_move(move, match_players[0].symbol)
                        raise "ERROR - Space already occupied."
                    end
                rescue => e
                    print e
                    retry
                end

                win_check = board.check_for_win(match_players[0].symbol)
                winning_mode = win_check[1]
                mode_iterator = win_check[2]
                break if win_check[0]
                match_players = match_players.reverse()
            end

            system "clear"

            unless winning_mode == "draw"
                round_winner = match_players[0].name
                @score[match_players[0].name.to_sym] += 1
                board.show_winning_board(round_winner, winning_mode, mode_iterator)          
            else
                board.show_winning_board("No one", winning_mode, mode_iterator)  
            end

            round_iterator += 1

            board.reset_board
        end

        anounce_match_winner
        ask_for_rematch(match_players)
        @score = {}
        
    end

    def pick_first_player(match_players)
        match_players << match_players.delete_at(rand(2))
        return match_players
    end

    def anounce_match_winner
        system "clear"

        if @score.values[0] == @score.values[1]
            puts "The match has ended in a draw!"
            return
        end

        winner = @score.keys[0]
        points = @score.values[0]
        puts "#{winner} won the match"
        puts "with a score of #{points}!"
        sleep(3)
        
    end

    def ask_for_rematch(match_players)
        system "clear"
        input = self.require_input(@@input_match[:require_rematch])
        case input
            when "yes", "y"
                start_match(match_players)
            when "no", "n"
                return
        end
    end
end