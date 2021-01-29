class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def values_at_height(node, height)
  return [] unless node

  return [node.val] if height == 1

  values_at_height(node.left, height-1) + values_at_height(node.right, height-1)
end

root = Node.new('a')
root.left = Node.new('b')
root.left.left = Node.new('d')
root.left.left.right = Node.new('e')
root.right = Node.new('c')

p values_at_height(root, 10)