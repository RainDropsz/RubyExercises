# frozen_string_literal: true

# Build a method #bubble_sort that takes an array and returns
# a sorted array. It must use the bubble sort methodology
# (using #sort would be pretty pointless, wouldn't it?).

def swap(array, index_one, index_two)
  temp = array[index_one]
  array[index_one] = array[index_two]
  array[index_two] = temp
end

def bubble_sort(array)
  0.upto(array.length - 2) do
    0.upto(array.length - 2) do |j|
      swap(array, j, j + 1) if array[j] > array[j + 1]
    end
  end

  array
end

p bubble_sort([4, 3, 78, 2, 0, 2, 0])
# [0,0,2,2,3,4,78]
