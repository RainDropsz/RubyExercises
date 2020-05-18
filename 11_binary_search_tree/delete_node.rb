# frozen_string_literal: true

# for deleting a node in a binary search tree
class DeleteNode < Tree
  def initialize(root, node)
    @root = root
    @node = node
  end

  def del_node_with_two_children(node = @node)
    # 1 - find successor = minimum (left-most value) of right sub-tree
    successor = find_successor(node)

    # 2 - copy successor contents into del-node
    node.value = successor[1].value

    # 3 - delete successor
    if successor[0].left == successor[1]
      successor[0].left = successor[1].right
    else
      successor[0].right = successor[1].right
    end
  end

  def find_successor(node)
    succ_parent = node
    successor = node.right

    until successor.left.nil?
      succ_parent = successor
      successor = succ_parent.left
    end

    [succ_parent, successor]
  end

  def find_parent_and_node(value)
    node = @root

    until node.value == value
      parent_node = node
      if value < node.value
        node.left  ? node = parent_node.left  : break
      else
        node.right ? node = parent_node.right : break
      end
    end
    [parent_node, node]
  end

  def del_node_with_one_or_zero_children(node = @node)
    return @root = (@root.left || @root.right) if node == @root

    connect_parent_to_new_child(find_parent_and_node(node.value)[0], node)
  end

  def connect_parent_to_new_child(parent_node, node = @node)
    if parent_node.left == node
      parent_node.left = (node.left || node.right)
    else
      parent_node.right = (node.left || node.right)
    end
  end

  #   def del(value)
  #     puts "delete value #{value}"
  #     node = find(value)
  #
  #     if value == node.value && node.left && node.right
  #       del_node_with_two_children(node)
  #     elsif value == node.value
  #       del_node_with_one_or_zero_children(node)
  #     end
  #   end
end
