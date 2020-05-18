# frozen_string_literal: true

# Project 1: Binary Search Trees
#
# You learned about binary search trees -
# where you take a group of data items and turn them into
# a tree full of nodes where each left node is "lower" than
# each right node. The tree starts with the "root node" and
# any node with no children is called a "leaf node".
#
# You also learned about tree traversal algorithms like
# breadth-first and depth-first which we'll attempt to implement here.
#
# You'll build a simple binary search tree in this assignment.
# In this lesson, our tree won't handle duplicate values as they are
# more complicated and result in trees that are much harder to balance.
# Be sure to always remove duplicate values or check for an
# existing value before inserting.

# Binary Search Tree
class Tree
  require_relative 'node'
  require_relative 'delete_node'
  require_relative 'print_tree'
  require_relative 'build_tree'

  include BuildTree

  def initialize(array)
    @root = nil
    @tmp_root = nil
    build_tree_iteration(array.sort.uniq)
    # @root = build_tree_recursion(array.sort.uniq)
  end

  # find method accepts a value and returns node with given value
  # if node not found, returns last leaf
  def find(value)
    node = @root
    return node if value == node.value

    until value == node.value
      if value < node.value
        node.left  ? node = node.left  : break
      else
        node.right ? node = node.right : break
      end
    end

    node
  end

  # accepts a value to insert into tree
  def insert(value)
    return @root = Node.new(value) if @root.nil?

    node = find(value)

    if value < node.value
      node.left  = Node.new(value)
    elsif value > node.value
      node.right = Node.new(value)
    else
      puts "Unable to insert #{value} because it already exists."
    end
  end

  def del(value)
    puts "delete value #{value}"
    node = find(value)
    delete = DeleteNode.new(@root, node)

    if value == node.value && node.left && node.right
      delete.del_node_with_two_children
    elsif value == node.value
      delete.del_node_with_one_or_zero_children
    end
  end

  def print_tree
    PrintTree.new(@root).print_tree
  end
end

# Testing----------------------------------------------
def benchmark_test(array)
  require 'benchmark'
  array = array.sort.uniq
  tree = Tree.new(array)

  Benchmark.bmbm do |x|
    x.report('recursion: ') { tree.build_tree_recursion(array)  }
    x.report('iteration: ') { tree.build_tree_iteration(array)  }
  end
end

# array = (1..2**20).map { (rand * 2**40).to_i }
# benchmark_test array

a = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
b = [10, 7, 14, 20, 1, 5, 8, 3, 9].sort.uniq # [1, 5, 7, 8, 10, 14, 20]
c = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
d = (1..2**5 - 3).map { (rand * 100).to_i }
tree = Tree.new(c)
tree.print_tree
tree.del(8)
tree.del(9)
tree.del(6)
tree.del(7)
tree.del(5)
tree.del(8)
tree.del(2)
tree.print_tree
