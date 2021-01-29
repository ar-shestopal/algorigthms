require 'pry'

class MaxPQ
  attr_accessor :arr, :size

  def initialize(arr)
    @arr = arr
    @size = arr.size
    build_heap if arr.size > 1
  end

  def get_max
    arr[0], arr[-1] = arr[-1], arr[0]

    result = arr.delete_at(-1)
    self.size -= 1

    heapify(0)
    result
  end

  def add(val)
    arr << val

    self.size += 1

    idx = arr.size - 1
    parent = (arr.size - 1) / 2

    while idx.positive? && arr[parent] < arr[idx]
      arr[idx], arr[parent] = arr[parent], arr[idx]

      idx = parent
      parent = (idx - 1) / 2
    end
  end

  private

  def build_heap
    start_idx = (size/2) - 1

    start_idx.downto(0) do |idx|
      heapify(idx)
    end
  end

  def heapify(i)
    largest = i
    l = 2 * i + 1
    r = 2 * i + 2

    largest = l if l < size && arr[l] > arr[largest]
    largest = r if r < size && arr[r] > arr[largest]

    if largest != i
      arr[i], arr[largest] = arr[largest], arr[i]

      heapify(largest)
    end
  end
end



arr = [ 1, 3, 5, 4, 6, 13, 10, 9, 8, 15, 17 ]

max_pq = MaxPQ.new(arr)

puts max_pq.inspect

max_pq.add(20)
max_pq.add(11)

5.times { p max_pq.get_max }

p max_pq.inspect

class MinPQ
  attr_accessor :arr, :size

  def initialize(arr)
    @arr = arr
    @size = arr.size
    build_heap if arr.size > 1
  end

  def get_min
    arr[0], arr[-1] = arr[-1], arr[0]

    result = arr.delete_at(-1)
    self.size -= 1

    heapify(0)
    result
  end

  def peek
    arr.first
  end

  def add(val)
    arr << val

    self.size += 1

    idx = arr.size - 1
    parent = (arr.size - 1) / 2

    while idx.positive? && arr[parent] > arr[idx]
      arr[idx], arr[parent] = arr[parent], arr[idx]

      idx = parent
      parent = (idx - 1) / 2
    end
  end

  private

  def build_heap
    start_idx = (size/2) - 1

    start_idx.downto(0) do |idx|
      heapify(idx)
    end
  end

  def heapify(i)
    smallest = i
    l = 2 * i + 1
    r = 2 * i + 2

    smallest = l if l < size && arr[l] < arr[smallest]
    smallest = r if r < size && arr[r] < arr[smallest]

    if smallest != i
      arr[i], arr[smallest] = arr[smallest], arr[i]

      heapify(smallest)
    end
  end
end



arr = [ 1, 3, 5, 4, 6, 13, 10, 9, 8, 15, 17 ]

min_pq = MinPQ.new(arr)

puts min_pq.inspect

min_pq.add(20)
min_pq.add(11)

5.times { p min_pq.get_min }

p min_pq.inspect

p arr.inspect












