module Dialogue

    def self.check_input(input, dictionary)
        dictionary.each do |word|
            return true if input == word
        end

        puts "\nERROR! Input has no match."
        puts "Please, type either of the following:"
        dictionary.each do |word|
            puts word
        end
        puts "\n"
        return false
    end
    
    def self.welcome
        puts "Welcome!"
    end

    def self.setup_match_mode
        entry_dictionary = ["pvp", "pvc"]
        input = nil

        loop do
            puts "Chose the match mode:"
            puts "pvp - player vs player"
            puts "pvc - playes vc computer"
            input = gets.chomp
            break if check_input(input, entry_dictionary)
        end

        return input
    end

    def self.setup_computer
        entry_dictionary = ["easy", "medium", "hard"]
        input = nil

        loop do
            puts "Chose the computer dificulty between easy, medium and hard:"
            input = gets.chomp
            break if check_input(input, entry_dictionary)
        end

        return input
    end

    def self.setup_rounds
        entry_dictionary = [1, 2, 3, 4, 5]
        input = nil

        loop do
            puts "Chose the number of rounds between 1 and 5:"
            input = gets.chomp.to_i
            break if check_input(input, entry_dictionary)
        end

        return input
    end
end
