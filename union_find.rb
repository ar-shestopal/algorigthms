require 'pry'

POSITIONS = [[-1, 0], [0, -1], [0, 1], [1, 0]]

# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} positions
# @return {Integer[]}
def num_islands2(m, n, positions)
  num = m * n
  uf = UnionFind.new(m, n)
  result = []

  positions.each do |position|
    x = position.first
    y = position.last
    idx = x * n + y
    uf.parent = idx

    neighb = neighbours(x, y, m, n, uf.parent)

    neighb.each do |idxn|
      uf.union(idx, idxn)
    end
    uf.print_parent
    uf.check_count
    result << uf.calculate_count
  end
  result
end

def neighbours(x, y, m, n, grid_arr)
  res = []
  POSITIONS.each do |(xs, ys)|
    xn = x + xs
    yn = y + ys

    idxn = xn * n + yn

    if xn >= 0 && xn < m && yn >= 0 && yn < n && grid_arr[idxn] > -1
      res << idxn
    end
  end
  res
end

class UnionFind
  attr_accessor :parent, :rank, :n, :m, :count

  def initialize(m, n)
    @parent = Array.new(n*m) { -1 }
    @rank = Array.new(n*m) { 0 }
    @m = m
    @n = n
    @count = 0
  end

  def print_parent
    p "--->>>"
    p parent.inspect
    parent.each_slice(n) { |sl| p sl.inspect }
    p "<<<---"
  end

  def check_count
    p "uniq: #{parent.uniq.select { |i| i > -1 && parent[i] == i }}"
  end

  def calculate_count
    @count
  end

  def parent=(i)
    @count += 1 if parent[i] == -1
    parent[i] = i
  end

  def find(x)
    return x if x == parent[x]

    temp = parent[x]
    parent[x] = find(temp)
    parent[x]
  end

  def union(x,y)
    p "--->>> union #{x} #{y}"
    root_x = find(x)
    root_y = find(y)

    if root_y == root_x
      return
    end

    if root_x != root_y
      if rank[root_x] > rank[root_y]
        parent[root_y] = root_x
      elsif rank[root_x] < rank[root_y]
        parent[root_x] = root_y
      else
        if root_x > root_y
          parent[root_x] = root_y
          rank[root_y] += 1
        else
          parent[root_y] = root_x
          rank[root_x] += 1
        end
      end
    end
    @count -= 1
  end
end

p num_islands2(8, 4, [[0,0],[7,1],[6,1],[3,3],[4,1]])