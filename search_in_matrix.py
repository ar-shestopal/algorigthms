def searchMatrix(mat, value):
  if len(mat) == 0:
    return False

  row_len = len(mat)
  col_len = len(mat[0])

  low = 0
  high = row_len * col_len

  while low < high:
    mid = (low + high) // 2

    if mat[mid // col_len][mid % col_len] == value:
      return True
    elif mat[mid // col_len][mid % col_len] < value:
      low = mid + 1
    else:
      high = mid

  return False


mat = [
    [1, 3, 5, 8],
    [10, 11, 15, 16],
    [24, 27, 30, 31],
]

print(searchMatrix(mat, 4))
# False

print(searchMatrix(mat, 10))
# True