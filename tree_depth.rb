class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def depth(root=nil)
  return 0 unless root

  1 + [depth2(root.left, 0), depth2(root.right, 0)].max
end

def depth2(root, depth)
  return depth+0 unless root

  return depth+1 if !root.left && !root.right

  return depth2(root.right, depth+1) unless root.left

  return depth2(root.left, depth+1) unless root.right

  [depth2(root.left, depth+1), depth2(root.right, depth+1)].max
end

root = Node.new('a')
root.left = Node.new('b')
root.left.left = Node.new('d')
root.left.left.right = Node.new('e')
root.right = Node.new('c')

p depth(root)