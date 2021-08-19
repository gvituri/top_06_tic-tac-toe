module InputCheck
    def input_check
        puts "checking input from #{self}"
    end

    def check_input(input, dictionary)
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
end