# frozen_string_literal: true

# Different ways to traverse the binary search tree
module Traversal
  # accepts a block, traverse the tree in breadth-first level order
  def level_order(node = @root, queue = [node], index = -1)
    until queue[index..-1].all? { |n| n.value.nil? }
      node = queue[index += 1]

      queue << (node&.left ? node.left : Node.new(nil))
      queue << (node&.right ? node.right : Node.new(nil))

      yield node if block_given?
    end
    queue
  end

  # left - root - right, requires block
  def in_order_recursion(node = @root)
    return yield node if node.leaf?

    in_order_recursion(node.left) { |n| yield n } if node.left
    yield node
    in_order_recursion(node.right) { |n| yield n } if node.right
  end

  # root - left - right, requires block
  def pre_order_recursion(node = @root)
    return yield node if node.leaf?

    yield node
    pre_order_recursion(node.left) { |n| yield n } if node.left
    pre_order_recursion(node.right) { |n| yield n } if node.right
  end

  # left - right - root, requires block
  def post_order_recursion(node = @root)
    return yield node if node.leaf?

    post_order_recursion(node.left) { |n| yield n } if node.left
    post_order_recursion(node.right) { |n| yield n } if node.right
    yield node
  end
end
