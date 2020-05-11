=begin
Project 1: Binary Search Trees

You learned about binary search trees – 
where you take a group of data items and turn them into 
a tree full of nodes where each left node is “lower” than 
each right node. The tree starts with the “root node” and 
any node with no children is called a “leaf node”.

You also learned about tree traversal algorithms like 
breadth-first and depth-first which we’ll attempt to implement here.

You’ll build a simple binary search tree in this assignment. 
In this lesson, our tree won’t handle duplicate values as they are 
more complicated and result in trees that are much harder to balance. 
Be sure to always remove duplicate values or check for an 
existing value before inserting.
=end


class Node
  attr_accessor :value, :left, :right

  def initialize(value='nil')
    @value = value
    @left  = nil
    @right = nil
  end
end


class Tree
  attr_reader :root, :array

  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree_iteration(array.sort.uniq)
  end

  #  build_tree: using iteration, breadth first
  #  n = length of array
  #  height of tree = log2(n) + 1
  #                              1/2n
  #                  1/4n                      3/4n
  #           1/8n          3/8n         5/8n           7/8n
  #      1/16n  3/16n   5/16n 7/16n   9/16n 11/16n  13/16n  15/16n

  def build_tree_iteration(array) 
    root = Node.new( array [ array.length / 2 ] )
    @root = root

    bfs_queue = []
    queue_index = 0

    2.upto(Math.log2(array.length) + 1) do |i|  
      1.step(2**i, 4) do |j|                    

        left_index =  (j)     * array.length / (2**i)
        right_index = (j + 2) * array.length / (2**i) 

#       p "i = #{i} ; j = #{j} ; root = #{root.value}"

        if array[left_index]            
          root.left = Node.new(array [ left_index ] )
          array[ left_index ] = nil
          bfs_queue << root.left 

#         p "Created root.left = #{root.left.value}"
        end

        if array[right_index]
          root.right = Node.new(array [ right_index] )
          array[ right_index ] = nil
          bfs_queue << root.right

#         p "Created root.right = #{root.right.value} "
        end

        root = bfs_queue[queue_index]
        queue_index += 1
      end
    end
      
    @root
  end

  def build_tree_recursion(array) 
    root = Node.new( array [ array.length / 2 ] )

    return root if array.length <= 1

    root.left  = build_tree_recursion( array [ 0 ..  array.length / 2 - 1 ]) 
    root.right = build_tree_recursion( array [ array.length / 2 + 1 .. -1 ]) 

    return root 
  end

  def insert(value)
        
        
  end

  def del(value)

  end

  def print_slashes(space, i, string)
    string <<  "\n"

    (2**i/2).times do
      string <<  "/". rjust( space + 0.5 + 1) 
      string <<  "\\  ".rjust( 2 * space - 1)
      string <<  "".rjust(space)
    end 

    string <<  "\n"

  end

  def remove_empty_row(string)
    string = string[0..string[0..string.rindex("\n") - 1].rindex("\n")]
  end


  def print_tree
    node = @root
    bst_queue = [node]
    string = "" 

    print_width = 40
    p @array

    string << "\n\n#{node.value.to_s.rjust(print_width / 2)}\n"


    1.upto(20) do |i|
      break if bst_queue.all? {|e| e.nil?}

      space = print_width/(2**i)/2.0 

      print_slashes(space, i, string)

      1.upto((2**i)/2) do |j|

        break if bst_queue.all? {|e| e.nil?}
        node = bst_queue.shift 

        if node && node.left
          string << node.left.value.to_s.rjust(space+0.5)
          bst_queue << node.left
        else 
          string << "x".rjust(space+0.5)
          bst_queue << nil
        end

        if node && node.right
          string << node.right.value.to_s.rjust(2*space)
          string << "".rjust(space)
          bst_queue << node.right
        else
          string << "x".rjust(2*space)
          string << "".rjust(space)
          bst_queue << nil
        end

      end

    end

    string = remove_empty_row(string)
    puts string
    puts "\n"
  end
end

#Testing----------------------------------------------
def benchmark_test(array)
  require 'benchmark'
  array = array.sort.uniq
  tree = Tree.new(array)

  Benchmark.bmbm do |x|
    x.report("recursion: ") { tree.build_tree_recursion(array)  }
    x.report("iteration: ") { tree.build_tree_iteration(array)  }
  end
end

# array = (1..2**20).map { (rand * 2**40).to_i } 
# benchmark_test array


a = [ 1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
b = [10,7,14,20,1,5,8,3, 9].sort.uniq   # [1, 5, 7, 8, 10, 14, 20]
c = [0,1,2,3,4,5,6,7,8,9,10]
d = (1..2**4-3).map { (rand * 100).to_i }
tree = Tree.new(d)
tree.print_tree




=begin
-----------------------------------------------
build_tree_recursion
[1, 5, 7, 8, 10, 14, 20]            
root = Node 8
root.left = build_tree([1,5,7])     
  root = Node 5
  root.left = build_tree([1])       root.left = Node 1
    root = Node 1                  
-------------------------
             5
        2         8
    1      4         9
  0      3              10

print root = 5
print root.left = 2
print root.right = 8   q = 2, 8 || 

root = 2
print root.left     1
print root.right    4   q = 2, 8, || 1, 4

root = 8
print root.left = nil
root.right = 9          q = 2 8 ||  1, 4, nil 9 || 

root = 1



    7
  1   9
0  3   10




=end

