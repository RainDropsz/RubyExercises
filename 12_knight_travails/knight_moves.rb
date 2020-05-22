# frozen_string_literal: true

require_relative 'tree.rb'

def knight_moves(start, finish)
  tree = Tree.new(start, finish)
  tree.search(finish)
end

knight_moves([0, 0], [3, 2])
knight_moves([0, 0], [3, 3])
knight_moves([0, 0], [1, 2])
knight_moves([3, 3], [0, 0])
