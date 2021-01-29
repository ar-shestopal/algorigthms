require 'pry'

class TreeNode
  attr_accessor :right, :left, :val

  def initialize(x)
    @left = nil
    @right = nil
    @val = x
  end
end

class BNode
  attr_accessor :node, :parent_val, :is_left
  def initialize(node, parent_val=nil, is_left=false)
    @node = node
    @parent_val = parent_val
    @is_left = is_left
  end
end

class Solution
  def self.valid_bst?(root)
    puts 'Recursive ', helper(root, Float::INFINITY, Float::INFINITY * -1)
    puts 'Not Recursive ', helper_stack(root)
  end


  def self.helper_stack(root)
    stack = []
    stack.push(BNode.new(root))

    while stack.any?
      current = stack.pop
      val = current.node.val
      parent_val = current.parent_val

      return false if parent_val && current.is_left && val >= parent_val

      return false if parent_val && !current.is_left && val <= parent_val

      if current.node.left
        stack.push(BNode.new(current.node.left, current.node.val, true))
      end

      if current.node.right
        stack.push(BNode.new(current.node.right, current.node.val))
      end
    end

    true
  end

  def self.helper(node, upper, lower)
    return true unless node

    val = node.val

    return false if val <= lower || val >= upper

    return false unless helper(node.left, val, lower)

    return false unless helper(node.right, upper, val)

    true
  end
end

node = TreeNode.new(5)
node.left = TreeNode.new(4)
node.right = TreeNode.new(3)

puts Solution.valid_bst?(node)