def caesar_cipher(string, num)

    alpha = [*'a'..'z']
    new_string = ""

    string.each_char do |char|
        index = alphabet.index(char.downcase)


        if alphabet.include?(char.downcase)
            if alphabet[index] == char
                new_string += alphabet[(index + num) % 26]
            elsif alphabet[index].upcase == char
                new_string += alphabet[(index + num) % 26].upcase
            end 
        else
            new_string += char
        end
    end

    puts new_string
end

caesar_cipher("What a string!", 5)
