=begin
The principal benefit of a linked list over a 
conventional array is that the list elements can 
easily be inserted or removed without reallocation 
of any other elements.

A linked list is a linear collection of data elements 
called nodes that “point” to the next node by means 
of a pointer.

Each node holds a single element of data and a link 
or pointer to the next node in the list.

A head node is the first node in the list, a tail node 
is the last node in the list. Below is a basic 
representation of a linked list:

[ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil
=end

#this class will represent the full list
class LinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  #add a new node at end of list
  def append(value)
    if @size == 0
      @head = Node.new(value)
    else
      node = @head
      node = node.link until node.link.nil?
      node.link = Node.new(value)
    end

    @size += 1
  end

  #add a new node to start of list
  def prepend(value)
    @head = Node.new(value, @head)
    @size += 1
  end

  #returns node at a given index
  def at(index)
    node = @head
    index.times { node = node.link }   
    node
  end 

  #remove last element from the list
  def pop
    node = @head
    if @size > 1
      node = node.link until node.link.link.nil?
      node.link = nil
    else 
      @head = nil
    end
    @size -= 1
  end

  #returns true if the passed in value is in the list
  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value 
      node = node.link
    end
    false
  end

  #returns index of node containing value
  def find(value)
    node = @head 
    for i in 0..@size-1 
      return i if node.value == value
      node = node.link 
    end
    return nil
  end

  #represent LinkedList as a string
  #( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    node = @head
    until node.nil?
      print "#{node.value} -> " 
      node = node.link
    end
  end

  def insert_at(value,index)
    return prepend(value) if index == 0
    return append(value)  if index >= @size

    node = @head 
    (index-1).times { node = node.link }

    node.link = Node.new(value, node.link)
    @size += 1
  end

  def remove_at(index)
    return if index >= size
    if index == 0
      @head = @head.link
    else
      node = @head
      (index-1).times { node = node.link }
      node.link = node.link.link
    end
    
    @size -= 1
  end

end

class Node 
  attr_accessor :value, :link

  def initialize(value = nil, link = nil)
    @value = value
    @link = link
  end

end

=begin test
a = LinkedList.new
a.append(2)
a.append(5)
a.append(7)
a.prepend(0)
a.prepend(3)
a.append(10)
a.prepend(15)
p a.to_s

a.insert_at(200, 3)
p a.to_s

a.insert_at(201, 4)
p a.to_s

a.insert_at(100, 0)
p a.to_s

a.remove_at(5)
p a.to_s

a.remove_at(0)
p a.to_s

a.remove_at(100)
p a.to_s

a.remove_at(7)
p a.to_s
=end
