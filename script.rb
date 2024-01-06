def get_sequences
    f = File.readlines("dictionary.txt", chomp: true)
    File.write("solutions.txt", "")
    p f.length
    words = f.select {|word| word.length >= 4}
    p words.length
    solutions = []
    known_subwords = {}
    words.each_with_index do |word, index|
        p 367522 - index
        # break if index > 500
        length = word.length
        (length - 3).times do |i|
            sub_word = word.slice(i, 4)
            if known_subwords[sub_word] == true
                next
            end
            known_subwords[sub_word] = true
            words_with_subword = []
            words.each do |dict_entry|
                if dict_entry.include?(sub_word)
                    words_with_subword << dict_entry
                end
            end
            if words_with_subword.length == 1
                open('solutions.txt', 'a') { |f|
                    f.puts sub_word + ": " + words_with_subword[0] + "\n"
                }
            end
        end
    end
    p "DONE!!!"
end

get_sequences()