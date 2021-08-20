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
end