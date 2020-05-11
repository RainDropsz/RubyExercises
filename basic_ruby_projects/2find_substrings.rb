=begin
Implement a method #substrings that takes a word as the first argument 
and then an array of valid substrings (your dictionary) as the second 
argument. It should return a hash listing each substring (case insensitive) 
that was found in the original string and how many times it was found.
=end


def substrings(string, dictionary)
=begin
  result = Hash.new(0)

  dictionary.each do |word|
    if str.include?(word)
      result[word] += string.downcase.scan(word).length
    end
  end
  result
=end

  dictionary.reduce(Hash.new(0)) do  |answer, word|
    answer[word] += string.downcase.scan(word).length
    answer
  end
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
# { "below" => 1, "low" => 1 }

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
# { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
