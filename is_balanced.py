class Node:
  def __init__(self, value, left=None, right=None):
    self.value = value
    self.left = left
    self.right = right

  def __repr__(self):
    result = str(self.value)
    if self.left:
      result = result + str(self.left)
    if self.right:
      result = result + str(self.right)
    return result


def gen_tree(nums):
  if len(nums) == 0:
    return [None]
  if len(nums) == 1:
    return [Node(nums[0])]
  bsts = []

  for n in nums:
    lefts = gen_tree(range(nums[0], n))
    rights = gen_tree(range(n + 1, nums[-1] + 1))
    print(n, rights, lefts)

    for left in lefts:
      for right in rights:
        tree = Node(n, left, right)
        bsts.append(tree)

  return bsts


def generate_bst(n):
  return gen_tree(range(1, n + 1))


print(generate_bst(3))
# 5 trees