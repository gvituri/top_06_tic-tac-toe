module CheckInput

    def check_input(mode, input, dictionary)
        case mode
            when "dictionary"
                return is_within_dictionary?(input, dictionary)
            when "integer"
                return is_integer?(input)
            when "symbol"
                return is_symbol?(input)
            when "long"
                return is_too_long?(input)
            when "move"
                return is_move_valid?(input)
        end
    end

    def is_within_dictionary?(input, dictionary)
        dictionary.each do |word|
            return true if input == word
        end
        return false
    end

    def is_integer?(input)
        if input.to_i <= 0
            return false
        end

        return Integer(input).is_a? Integer
    end

    def is_symbol?(input)
        return input.strip.length == 1
    end

    def is_too_long?(input)
        return input.strip.length <= 10
    end

    def is_move_valid?(input)
        input = input.downcase.split("")

        unless input.length == 2
            p "false"
            return false
        end

        return (input[0].ord.between?(97, 99) && input[1].ord.between?(48, 50)) || (input[1].ord.between?(97, 99) && input[0].ord.between?(48, 50))

    end
end