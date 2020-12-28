class Caesar_cipher
    def caesar_cipher(string, num)

        alphabet = [*'a'..'z']
        new_string = ""
        # numbers = [*1..9]
        # alphabet.concat(numbers)
        # puts alpha    bet
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
        new_string
    end
end

Caesar_cipher.new.caesar_cipher("What a string!", 5)
