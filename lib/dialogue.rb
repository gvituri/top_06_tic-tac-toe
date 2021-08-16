module Dialogue

    @@Dialogue_pool = {
        welcome: [["none"],
            ["Welcome!",
            "Hit enter to start a match."]],
        setup_mode: [["pvp", "pvc"],
            ["Chose the match mode:",
            "pvp - player vs player",
            "pvc - playes vc computer"]],
        setup_computer: [["easy", "medium", "hard"],
            ["Chose the computer dificulty:",
            "easy",
            "medium",
            "hard"]],
        setup_rounds: [["1", "2", "3", "4", "5"],
            ["Chose the number of rounds between 1 and 5:"]],
        setup_player_name: [["none"],
            ["Input player's name:"]],
        setup_player_symbol: [["none"], 
            ["Input player's symble:"]]
    }

    def self.check_input(input, dictionary)
        loop do
            dictionary.each do |word|
                return word if input == word
            end

            puts "\nERROR! Input has no match."
            puts "Please, type either of the following:"
            dictionary.each do |word|
                puts word
            end
            puts "\n"

            input = gets.chomp
        end
    end

    def self.print_dialogue(dialogue_section)
        dictionary_array = @@Dialogue_pool[dialogue_section][0]
        dialogue_array = @@Dialogue_pool[dialogue_section][1]

        puts "\n"
        
        dialogue_array.each do |phrase|
            puts phrase
        end

        player_input = gets.chomp

        unless dictionary_array[0] == "none"
            player_input = check_input(player_input, dictionary_array)
            return player_input
        end

        return player_input
    end
end
