# frozen_string_literal: true

require_relative 'binary_search_tree.rb'

def benchmark_test(array)
  require 'benchmark'
  array = array.sort.uniq
  tree = Tree.new(array)

  Benchmark.bmbm do |x|
    x.report('recursion: ') { tree.build_tree_recursion(array)  }
    x.report('iteration: ') { tree.build_tree_iteration(array)  }
  end
end

# #11: Write a simple driver script
array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)
tree.print_tree
puts "Tree balanced?  #{tree.balanced? ? 'yes' : 'no'}"
print 'Level Order: '
tree.level_order { |node| print "#{node.value} " }
puts "\n"
print 'Pre Order: '
tree.pre_order_recursion { |node| print "#{node.value} " }
puts "\n"
print 'Post Order: '
tree.post_order_recursion { |node| print "#{node.value} " }
puts "\n"
print 'In Order: '
tree.in_order_recursion { |node| print "#{node.value} " }
puts "\n"

5.times { tree.insert rand(1..200) }
tree.print_tree
puts "Tree balanced?  #{tree.balanced? ? 'yes' : 'no'}"
tree.rebalance!
tree.print_tree
puts "Tree balanced?  #{tree.balanced? ? 'yes' : 'no'}"
print 'Level Order: '
tree.level_order { |node| print "#{node.value} " }
puts "\n"
print 'Pre Order: '
tree.pre_order_recursion { |node| print "#{node.value} " }
puts "\n"
print 'Post Order: '
tree.post_order_recursion { |node| print "#{node.value} " }
puts "\n"
print 'In Order: '
tree.in_order_recursion { |node| print "#{node.value} " }
puts "\n"
