class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

root = Node.new('a')
root.left = Node.new('b')
root.left.left = Node.new('d')
root.left.left.right = Node.new('e')
root.right = Node.new('c')

def depth(node)
  return 0 unless node

  depth = 1
  stack = [[depth, node]]

  while stack.any?
    curr_depth, node = stack.pop
    depth = [depth, curr_depth].max
    stack << [depth+1, node.left] if node.left
    stack << [depth+1, node.right] if node.right
  end

  depth
end

p depth(root)

