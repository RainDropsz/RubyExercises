=begin
Build a method #bubble_sort that takes an array and returns 
a sorted array. It must use the bubble sort methodology 
(using #sort would be pretty pointless, wouldn’t it?).
=end

def bubble_sort(array)
  end_sort = array.length - 2

  for i in 0..end_sort do 

    for j in 0..end_sort do

      if array[j] > array[j+1]
        number_holder = array[j]
        array[j] = array[j+1]
        array[j+1] = number_holder
      end

    end

    end_sort = end_sort - 1     

  end

  p array
end


bubble_sort([4,3,78,2,0,2,0])
# [0,0,2,2,3,4,78]

