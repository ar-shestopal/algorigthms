def solution(arr)
    # Type your solution here

    return 0 unless arr
    return 0 unless arr.size > 2

    return "Right" if arr.size == 2

    left = [arr[2]]
    right = [arr[1]]

    find_nodes(1, arr, right)
    find_nodes(2, arr, left)

    r_sum = right.sum
    l_sum = left.sum

    if r_sum > l_sum
        "Right"
    elsif l_sum > r_sum
        "Left"
    else
        0
    end
end

def find_nodes(i, arr, res_arr)
    l = (2 * i) + 1
    r = (2*i) + 2

    if l < arr.size
        left = arr[l]
        res_arr << left
        find_nodes(l, arr, res_arr)
    end

    if r < arr.size
        right = arr[r]
        res_arr << right
        find_nodes(r, arr, res_arr)
    end
end


arr = [3,6,2,-1,9,10]

p solution(arr)