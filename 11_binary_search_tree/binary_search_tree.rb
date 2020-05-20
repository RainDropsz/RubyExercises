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
  require_relative 'traversal'

  include BuildTree
  include Traversal

  def initialize(array)
    @root = build_tree_iteration(array.sort.uniq)
    # @root = build_tree_recursion(array.sort.uniq)
  end

  # find method accepts a value and returns node with given value
  # if node not found, returns last leaf
  def find(value, node = @root)
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

  # delete a node from binary search tree
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

  # accepts a node, returns the depth
  def depth(node, current = @root, count = 0)
    until current == node
      current = node.value < current.value ? current.left : current.right
      count += 1
    end
    count
  end

  # checks if the tree is balanced
  def balanced?
    array = level_order
    first_nil_pos = array.index { |node| node.value.nil? }
    last_nil_pos = array.rindex(&:value)

    first_depth = Math.log2(first_nil_pos + 1) - 1
    last_depth = Math.log2(last_nil_pos + 1)

    (first_depth.to_i - last_depth.to_i).between?(-1, 1)
  end

  # rebalance tree
  def rebalance!(array = [])
    in_order_recursion { |node| array << node.value }
    @root = build_tree_iteration(array)
  end

  # prints tree
  def print_tree
    PrintTree.new(@root).print_tree
  end
end
