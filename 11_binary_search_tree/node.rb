# frozen_string_literal: true

# Node for binary search tree
class Node
  attr_accessor :value, :left, :right

  def initialize(value = 'nil')
    @value = value
    @left  = nil
    @right = nil
  end

  def leaf?
    @left.nil? && @right.nil?
  end
end
