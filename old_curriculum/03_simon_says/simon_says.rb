#write your code here
def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, times = 2)
  repeated = []
  times.times { repeated << string }
  repeated.join(" ") 
end

def start_of_word(string, num_of_letter = 1)
  string[0..num_of_letter - 1]
end

def first_word(string)
  string[0..string.index(" ")-1]
end

def titleize(string)
  array = string.split(" ")
  lowercase_array = ["and", "in", "over", "the"]

  for i in 0..array.length-1
    if i == 0
      array[i][0] = array[i][0].upcase
    elsif not lowercase_array.include?(array[i]) 
      array[i][0] = array[i][0].upcase
    end
  end  

  array.join(" ")
end

puts titleize("the bridge over the river kwai")
