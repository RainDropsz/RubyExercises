# frozen_string_literal: true

def merge_sort(arr)
  return arr if arr.length <= 1

  arr1 = merge_sort(arr[0..arr.length / 2 - 1])
  arr2 = merge_sort(arr[arr.length / 2..-1])

  (0..arr.length - 1).each do |i|
    arr[i] = if arr1.empty?
               arr2.shift
             elsif arr2.empty?
               arr1.shift
             else
               arr1[0] < arr2[0] ? arr1.shift : arr2.shift
             end
  end

  arr
end

p merge_sort([2, 15, 0, 3, 2, 10, 1, 15])
