# frozen_string_literal: true

# this module builds a binary search tree from an array
module BuildTree
  # build_tree: using iteration, breadth first
  # n = length of array
  # height of tree = log2(n) + 1
  #                              1/2n
  #                  1/4n                      3/4n
  #           1/8n          3/8n         5/8n           7/8n
  #      1/16n  3/16n   5/16n 7/16n   9/16n 11/16n  13/16n  15/16n

  def build_tree_iteration(array)
    @root = Node.new(array [array.length / 2])
    @tmp_root = @root

    queue = []

    2.upto(Math.log2(array.length) + 1) do |i|
      1.step(2**i, 4) do |j|
        root_add_left_child(array, i, j, queue)
        root_add_right_child(array, i, j, queue)

        @tmp_root = queue.shift
      end
    end
  end

  def root_add_left_child(array, row, col, queue)
    left_index = col * array.length / (2**row)
    return unless array[left_index]

    @tmp_root.left = Node.new(array [left_index])
    array[left_index] = nil
    queue << @tmp_root.left
  end

  def root_add_right_child(array, row, col, queue)
    right_index = (col + 2) * array.length / (2**row)
    return unless array[right_index]

    @tmp_root.right = Node.new(array [right_index])
    array[right_index] = nil
    queue << @tmp_root.right
  end

  #  def build_tree_recursion(array)
  #    root = Node.new(array [array.length / 2])
  #    return root if array.length <= 1

  #    root.left  = build_tree_recursion(array [0..array.length / 2 - 1])
  #    root.right = build_tree_recursion(array [array.length / 2 + 1..-1])

  #    root
  #  end
end
