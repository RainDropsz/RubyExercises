#write your code here
def translate(string)
  vowels = ["a", "e", "i", "o", "u"]
  array = string.split(" ")

  for i in 0..array.length-1
    string = array[i]
    test_string = string.gsub("qu", "qq")

    vowel_index = 
      [test_string.index("a").nil? ? 999 : string.index("a"), 
       test_string.index("e").nil? ? 999 : string.index("e"), 
       test_string.index("i").nil? ? 999 : string.index("i"), 
       test_string.index("o").nil? ? 999 : string.index("o"),
       test_string.index("u").nil? ? 999 : string.index("u")].min
    
    if vowel_index == 0
      string = string + "ay"
    else
      string = string[vowel_index..-1] + string[0..vowel_index-1] + "ay"
    end

    array[i] = string
  end

  answer = array.join(" ")
  answer

end

translate("banana")
