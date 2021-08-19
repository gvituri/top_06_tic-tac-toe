module RequireInput

    def require_input(input_info)
        begin
            puts input_info[1]
            input = gets.chomp
            unless self.check_input(input_info[0], input, input_info[2])
                raise input_info[3]
            end
        rescue => e
            puts e
            retry
        end

        return input
    end
end