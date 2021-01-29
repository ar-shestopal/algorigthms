a = [2, 3, 4, 6, 8, 8, 9, 10, 11, 16]
a0 = []
a1 = [9]
a3 = [1, 2, 9]

def search(nums, target)
    i = 0
    j = nums.size - 1
    return recursive_search(nums, target, i, j)
end

def recursive_search(arr, target, i, j)
    return -1 unless i <= j
    
    mid = i + (j - i) / 2
    
    return mid if arr[mid] == target

    return recursive_search(arr, target, i, mid-1) if arr[mid] > target

    return recursive_search(arr, target, mid+1, j) if arr[mid] < target
end


puts search(a3, 9)
