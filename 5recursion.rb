def fibs(n)
  #use iteration
  result = []

  for i in 0..n  
    i == 0 || i == 1 ?
    result[i] = i : 
    result[i] = result[i-1] + result[i-2]
  end
  result
end


def fibs_rec(n, result=[], orig_n=n)
  if n == 0
    result[0] = 0
    return 0
  elsif n == 1
    result[1] = 1
    return 1
  else 
    answer = fibs_rec(n-1, result, orig_n) + fibs_rec(n-2, result, orig_n)
    result[n] = answer; 
    return result if n == orig_n
    return answer
  end
end



def merge_sort(arr)
  return arr if arr.length <= 1

  arr1 = merge_sort( arr[0 .. arr.length/2-1] )
  arr2 = merge_sort( arr[arr.length/2  .. -1] )

  for i in 0..arr.length-1
    if arr1.empty? 
      arr[i] = arr2.shift
    elsif arr2.empty? 
      arr[i] = arr1.shift
    else
      arr1[0] < arr2[0] ? arr[i] = arr1.shift : arr[i] = arr2.shift
    end
  end

  return arr
end


p fibs(5)
p fibs_rec(5)

p fibs(20)
p fibs_rec(20)

p merge_sort([2,15,0,3,2,10,1,15])
