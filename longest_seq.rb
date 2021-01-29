def longest_sequence(number)
    binary = number.to_s(2).split('')
    p binary.inspect
    longest = 1
    curr_size = 1

    (1...binary.size).each do |win_end|
        val = binary[win_end]

        if val == binary[win_end-1]
            curr_size += 1
        else
            p "#{val} - #{curr_size} - #{longest}"
            longest = [curr_size, longest].max
            curr_size = 1
        end
        longest = [curr_size, longest].max
    end

    longest
end

p longest_sequence(245)
p longest_sequence(1023)