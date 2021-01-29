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

def build_freequncies(root, counter)
  return 0 unless root

  total = root.val + build_freequncies(root.left, counter) + build_freequncies(root.right, counter)

  counter[total] += 1
  total
end

def most_freequent_sum(root)
  counter = Hash.new(0)
  build_freequncies(root, counter)
  counter
end


n1 = Node.new(3, Node.new(1), Node.new(-3))
puts(most_freequent_sum(n1))
