require 'set'
require 'pry'

POSITIONS = [[-1, 0], [0, -1], [0, 1], [1, 0]]

# @param {Integer[][]} matrix
# @return {Integer}
def shortest_path(matrix)
  Solution.new(matrix).run
end

class Solution
  attr_accessor :matrix, :rows, :cols, :dist, :prev, :visited

  def initialize(matrix)
    @matrix = matrix

    @rows = matrix.size
    @cols = matrix[0].size

    @dist = Array.new(rows) { Array.new(cols) { -Float::INFINITY } }
    @prev = Array.new(rows) { Array.new(cols) }
    @visited = Set.new
  end

  def run
    (0...rows).each do |i|
      (0...cols).each do |j|
        dfs(i, j)
      end
    end
  end

  private

  def neighbors(x, y)
    res = []
    POSITIONS.each do |(x_shift, y_shift)|
      xs = x + x_shift
      ys = y + y_shift
      if xs >= 0 && xs < rows && ys >= 0 && ys < cols && !visited.include?([xs, ys])
        res << [xs, ys]
      end
    end
    res
  end

  def dfs(x, y, prev_x=nil, prev_y=nil)
    wedge = prev_x && prev_y ? matrix[x][y] + dist[prev_x][prev_y] : 0
    binding.pry

    if wedge > dist[x][y]
      dist[x][y] = wedge
      prev[x][y] = [prev_x, prev_y]
    end

    adjaicent = neighbors(x, y)


    adjaicent.each do |(a_x, a_y)|
      dfs(a_x, a_y, x, y)
    end
    visited << [x, y]
  end
end


matrix = [[9,9,4],[6,6,8],[2,1,1]]

Solution.new(matrix).run
