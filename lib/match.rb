require_relative 'input_check.rb'

class Match
    include InputCheck
    attr_accessor :mode, :round_number, :scores

    def initialize
        @mode = setup_mode
        @round_number = setup_rounds
        @scores = setup_scores
    end

    def setup_mode
        self.input_check
        return "mode"
    end

    def setup_rounds
        self.input_check
        return "x rounds"
    end

    def setup_scores
        #should return a hash with
        #   key     value
        #   p_name  wins
        return "scores"
    end
end