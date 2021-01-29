def jumpToEnd(nums):
  jumps = [float('inf')] * len(nums)
  jumps[0] = 0

  for i, n in enumerate(nums):
    for j in range(1, n + 1):
      if i + j < len(nums):
        jumps[i + j] = min(jumps[i + j], jumps[i] + 1)
      else:
        break

  return jumps[-1]


print jumpToEnd([3, 2, 5, 1, 1, 9, 3, 4])
# 2