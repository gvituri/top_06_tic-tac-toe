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
            round_winner = match_players[0].name
            @score[match_players[0].name.to_sym] += 1
            board.show_winning_board(round_winner, winning_mode, mode_iterator)

            puts @score

            round_iterator += 1

            board.reset_board
        end
        
    end
end