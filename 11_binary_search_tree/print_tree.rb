# frozen_string_literal: true

# This module prints a binary search tree
class PrintTree < Tree
  def initialize(root)
    @root = root
    @screen_width = 80
    @string = ''
    @string += "\n\n#{@root.value.to_s.rjust(@screen_width / 2)}\n"
    @queue = [@root]
  end

  def print_tree
    puts make_tree_string if @root
  end

  def make_tree_string(node = @root)
    1.upto(20) do |i|
      break if @queue.all?(&:nil?)

      space = @screen_width / (2**i) / 2.0
      print_slashes(space, i)

      1.upto((2**i) / 2) do
        node = @queue.shift
        print_children(node, space)
      end
    end
    remove_empty_row
  end

  def print_children(node, space)
    print_left_child(node, space)
    print_right_child(node, space)
    @string << ''.rjust(space)
  end

  def print_left_child(node, space)
    if node&.left
      @string << node.left.value.to_s.rjust(space + 0.5)
      @queue << node.left
    else
      @string << 'x'.rjust(space + 0.5)
      @queue << nil
    end
  end

  def print_right_child(node, space)
    if node&.right
      @string << node.right.value.to_s.rjust(2 * space)
      @queue << node.right
    else
      @string << 'x'.rjust(2 * space)
      @queue << nil
    end
  end

  def print_slashes(space, row)
    @string << "\n"

    (2**row / 2).times do
      @string <<  '/'. rjust(space + 0.5 + 1)
      @string <<  '\\  '.rjust(2 * space - 1)
      @string <<  ''.rjust(space)
    end

    @string << "\n"
  end

  def remove_empty_row
    last_new_line = @string.rindex("\n")
    second_last_new_line = @string [0..last_new_line - 1] . rindex("\n")
    @string[0..second_last_new_line] << "\n"
  end
end
