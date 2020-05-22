# frozen_string_literal: true

# Knight Travails tree of moves
class Tree
  require_relative 'node.rb'

  def initialize(start, finish)
    build_tree(start, finish)
  end

  # build tree from start to finish using breadth traversal.
  def build_tree(start, finish, node = Node.new(start), queue = [node])
    @root = node

    until queue.index { |n| n.value == finish }
      node = queue.shift
      node.children = generate_move_nodes(node.value, finish)
      node.children.each { |c| queue << c }
    end
  end

  # start at root, search all the way down branch
  # going down, mark nodes as in progress
  # coming up, mark nodes as complete
  # once finish is found, path = inprogress nodes
  def search(finish, node = @root, complete = [], inprogress = [])
    inprogress << node

    print_path(finish, inprogress) if node.value == finish

    node.children.each do |child|
      search(finish, child, complete, inprogress)
    end

    complete << node
    inprogress.delete(node)
  end

  def print_path(finish, inprogress)
    print "Shortest path from #{@root.value} to #{finish} is: "
    inprogress.each { |n| print "#{n.value} " }
    puts "\n"
  end

  def moveset
    [[2, -1], [2, 1], [1, -2], [1, 2], [-1, -2], [-1, 2], [-2, -1], [-2, 1]]
  end

  def generate_move_nodes(start, finish, array = [])
    moveset.each do |move|
      value = [start[0] + move[0], start[1] + move[1]]
      if value[0].between?(0, 7) && value[1].between?(0, 7)
        array << Node.new(value)
      end

      break if value == finish
    end
    array
  end
end
