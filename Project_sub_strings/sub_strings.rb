dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(string,dictionary)
    count = Hash.new(0)
    dictionary.map{ |word|
        if string.downcase.include?(word)
            count[word] = string.scan(word).count
        end
        puts word
        puts count
    }
end
p substrings("Howdy partner, sit down! How's it going?",dictionary)
    