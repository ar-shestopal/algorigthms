require 'pry'
require 'pp'

a = [
      ['1', '0', '0'],
      ['1', '1', '0'],
      ['1', '0', '0']
    ]

class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end



class Solution

  def sink_island(grid, i, j)
    if grid[i][j] == '1'
      grid[i][j] = '0'
      sink_island(grid, i, j+1) if j+1 < grid.size
      sink_island(grid, i, j-1) if j-1 >= 0
      sink_island(grid, i+1, j) if i+1 < grid.size
      sink_island(grid, i-1, j) if i-1 >= 0
    else
      return
    end
  end

  def iter_sink_island(grid, i, j)
    return unless grid[i][j] == '1'

    s = []
    s << Point.new(i, j)

    while s.any?
      point = s.pop
      x = point.x
      y = point.y

      grid[x][y] = '0'
      neighbors(grid, x, y).each do |adj|
        s << adj if grid[adj.x][adj.y] == '1'
      end
      puts s.size
    end
  end

  def neighbors(grid, i, j)
    [].tap do |result|
      result << Point.new(i, j+1) if j+1 < grid.size
      result << Point.new(i, j-1) if j-1 >= 0
      result << Point.new(i+1, j) if i+1 < grid.size
      result << Point.new(i-1, j) if i-1 >= 0
    end
  end

  def count_connected(grid)
    n = grid.size
    counter = 0

    (0...n).step do |x|
      (0...n).step do |y|
        if grid[x][y] == '1'
          counter += 1
          iter_sink_island(grid, x, y)
        end
      end
    end

    p counter
  end
end


Solution.new.count_connected(a)
