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

require 'benchmark'

class Node
  attr_accessor :value, :left, :right

  def initialize(value='nil')
    @value = value
    @left  = nil
    @right = nil
  end
end


class Tree
  attr_reader :root

  def initialize(array)
    Benchmark.bm do |x|
      x.report("iteration: ")  { build_tree(array) }
      x.report("recursion: ")  { build_tree_recursion(array) }
    end
  end


  def build_tree(array) #uses iteration,= breadth first
    array = array.sort.uniq
    root = Node.new( array [array.length / 2] )
    @root = root
    bfs_queue = []
    k = 0


    2.upto(Math.log2(array.length) + 1) do |i|
      1.step(2**i, 4) do |j|
#         p "i = #{i} ; j = #{j} ; root = #{root.value}"
         left_index = (j) * array.length / (2**i)
         right_index = (j + 2) * array.length / (2**i) 

         if array[left_index]            
           root.left = Node.new(array [ left_index ] )
            array[ left_index ] = nil
#           p "Created root.left = #{root.left.value}"
           bfs_queue << root.left 
         end

         if array[right_index]
           root.right = Node.new(array [ right_index] )
            array[ right_index ] = nil
#           p "Created root.right = #{root.right.value} "
           bfs_queue << root.right
         end
        root = bfs_queue[k]
#        bfs_queue.each {|x| puts x.value;}
        k += 1
      end
    end
      
    @root

  end

  
  def build_tree_recursion(array)
    root = Node.new( array [ array.length / 2 ] )

    return root if array.length <= 1

    root.left  = build_tree( array [ 0 ..  array.length / 2 - 1 ]) 
    root.right = build_tree( array [ array.length / 2 + 1 .. -1 ]) 

    return root 
  end

  def insert(value)
    
  end

  def del(value)

  end

  def print_tree
#    p "#{@root.value}  \n"
#    p "#{@root.left.value}  #{@root.right.value}  \n"
#    p "#{@root.left.left.value}  #{@root.left.right.value}  #{@root.right.left.value}  #{@root.right.right.value} \n"
#    p "#{@root.left.left.left.value}  {@root.left.left.right.value}  #{@root.left.right.left.value}  {@root.left.right.right.value}  {@root.right.left.left.value}  #{@root.right.left.right.value}     {@root.right.right.left.value}  #{@root.right.right.right.value}" 
  end
end

#Testing----------------------------------------------

a = [ 1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
b = [10,7,14,20,1,5,8,3, 9].sort.uniq   # [1, 5, 7, 8, 10, 14, 20]
c = [0,1,2,3,4,5,6,7,8,9,10]
d = (1..100000).map {rand}
tree = Tree.new(d)
tree.print_tree


=begin
-----------------------------------------------
My notes for this headache!!! 
build_tree_recursion
[1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345]
root = Node 8
root.left = build[1,3,4,5,7]  
  root = Node 4               
  root.left = build[1,3]      
    root = Node 3
    root.left = build[1]                   
      root = Node 1

                   8
            4            67
         3     7     23      6345
       1     5      9       324


[1, 5, 7, 8, 10, 14, 20]            
root = Node 8
root.left = build_tree([1,5,7])     
  root = Node 5
  root.left = build_tree([1])       root.left = Node 1
    root = Node 1                  
-------------------------
build_tree iteration

n = length of array
height of tree = log2(n) + 1
Used breadth first search queue to traverse nodes
                              1/2n
                  1/4n                      3/4n
           1/8n          3/8n         5/8n         7/8n
      1/16n  3/16n   5/16n 7/16n   9/16n 11/16n 13/16n  15/16n

=end

