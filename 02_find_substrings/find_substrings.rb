# frozen_string_literal: true

# Implement a method #substrings that takes a word as the first argument
# and then an array of valid substrings (your dictionary) as the second
# argument. It should return a hash listing each substring (case insensitive)
# that was found in the original string and how many times it was found.

def substrings(string, dictionary)
  #   result = Hash.new(0)
  #
  #   dictionary.each do |word|
  #     if str.include?(word)
  #       result[word] += string.downcase.scan(word).length
  #     end
  #   end
  #   result

  dictionary.each_with_object(Hash.new(0)) do |word, answer|
    answer[word] += string.downcase.scan(word).length
  end
end

dictionary =
  %w[below down go going horn how howdy it i low own part partner sit]
puts substrings('below', dictionary)
# { "below" => 1, "low" => 1 }

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
# { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2,
# "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
