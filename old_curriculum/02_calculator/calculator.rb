#write your code here

def add(x,y)
  x.to_f + y.to_f
end

def subtract(x,y)
  x.to_f - y.to_f
end

def sum(arr)
  if arr.empty?
    0
  else
    x = 0

    arr.each do |n|
      x = x + n
    end

    x
  end
end

def multiply(arr)
  if arr.empty?
    0
  else
    x = 1

    arr.each do |n|
      x = x * n
    end

    x
  end
end

arr = [1, 2, 3]
puts sum(arr)

