class Node
  attr_accessor :left, :right, :val
  def initialize(val, left=nil, right=nil)
    @val = val
    @left = left
    @right = right
  end

  def to_s
    "#{val}, #{left}, #{right}"
  end
end

def filter(node, num)
  return nil unless node
  puts node.left&.val
  puts node.right&.val

  node.left = filter(node.left, num)
  node.right = filter(node.right, num)

  return nil if node.val != num && !node.left && !node.right

  node
end

n1 = Node.new(1, Node.new(2, Node.new(2), Node.new(1, Node.new(1))))
puts(filter(n1, 2))
