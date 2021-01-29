R = 10

def sort(arr)
  n = arr.size

  out = [0] * n

  aux = [0] * n

  count = [0] * (R + 1)

  (0...n).each { |i| count[arr[i]] += 1 }
  p count.inspect, count.size

  (0...R).each { |r| count[(r+1)] += count[r] }

  (0...n).each { |j| aux[count[arr[j]]] = arr[j] }

  puts arr.inspect
  puts count.inspect
  puts aux.inspect
end

def assert(expr)
  raise "Accertion failed" unless expr == true
end

assert(sort([1,3,4,2,6,5]) == [1,2,3,4,5,6])


