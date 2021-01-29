class Node(object):
  def __init__(self, value, left=None, right=None):
    self.value = value
    self.left = left
    self.right = right


class Solution(object):
  def __find_node(self, tree, val, parent_val, height):
    if tree == None:
      return False
    if tree.value == val:
      return (height, parent_val)
    return (self.__find_node(tree.left, val, tree.value, height + 1) or
            self.__find_node(tree.right, val, tree.value, height + 1))

  def __get_cousins(self, tree, val, parent_val, height):
    if tree == None or tree.value == parent_val:
      return []
    if height == 0:
      return [tree.value]
    return (self.__get_cousins(tree.left, val, parent_val, height - 1) +
            self.__get_cousins(tree.right, val, parent_val, height - 1))

  def list_cousins(self, tree, val):
    height, parent_val = self.__find_node(tree, val, None, 0)
    return self.__get_cousins(tree, val, parent_val, height)

#     1
#    / \
#   2   3
#  / \    \
# 4   6    5
root = Node(1)
root.left = Node(2)
root.left.left = Node(4)
root.left.right = Node(6)
root.right = Node(3)
root.right.right = Node(5)

print Solution().list_cousins(root, 5)
# [4, 6]