module Dialogue
    def self.check_input(input, dictionary)
        dictionary.each do |word|
            return true if input == word
        end
        return false
    end
    
    def self.welcome
        puts "Welcome!"
    end

    def self.setup_match_mode
        entry_dictionary = ["pvp", "pvc"]
        input = nil

        begin
            loop do
                puts "Chose the match mode by typing pvp or pvc"
                puts "pvp - player vs player"
                puts "pvc playes vc computer"
                input = gets.chomp
                break if check_input(input, entry_dictionary)
            end
        rescue
        end

        return input
    end
end