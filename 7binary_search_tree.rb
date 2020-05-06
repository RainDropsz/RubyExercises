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
  attr_reader :root

  def initialize(array)
    @root =  build_tree(array.sort.uniq)
  end

  def build_tree(array)
    root = Node.new( array [ array.length / 2 ] )

    return root if array.length <= 1

    root.left  = build_tree( array [ 0 ..  array.length / 2 - 1 ]) 
    root.right = build_tree( array [ array.length / 2 + 1 .. -1 ]) 

    return root 
  end
  def print_tree
    puts "#{ @root.value}  \n"
    puts "#{@root.left.value}  #{@root.right.value}  \n"
    puts "#{@root.left.left.value}  #{@root.left.right.value}  #{@root.right.left.value}  #{@root.right.right.value} \n"
    puts "#{@root.left.left.left.value}  #{@root.left.left.right.value}  #{@root.left.right.left.value}  #{@root.left.right.right.value}  #{@root.right.left.left.value}  #{@root.right.left.right.value}     #{@root.right.right.left.value}  #{@root.right.right.right.value}" 
  end
end

#Testing----------------------------------------------

a = [ 1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
b = [10,7,14,20,1,5,8,3, 9].sort.uniq   # [1, 5, 7, 8, 10, 14, 20]
tree = Tree.new(a)
p a.sort.uniq
tree.print_tree



=begin
-----------------------------------------------
My notes for this headache!!! 
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
=end

