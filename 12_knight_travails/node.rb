# frozen_string_literal: true

# Node for Knight Travails
# Contains array of 0-8 children
class Node
  attr_accessor :value, :children
  def initialize(value = nil, array = [])
    @value = value
    @children = array
  end
end
