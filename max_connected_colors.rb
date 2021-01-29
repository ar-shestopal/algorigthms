require 'set'

class Grid
  POSITIONS = [[-1, 0], [0, -1], [0, 1], [1, 0]]

  attr_reader :grid
  def initialize(grid)
    @grid = grid
  end

  def max_connected_colors
    n_max1 = 0
    n_max2 = 0
    (0...grid.size).each do |y|
      (0...grid[y].size).each do |x|
        n_max1 = [n_max1, recursive_dfs(x, y, Set.new)].max
        n_max2 = [n_max2, iterative_dfs(x, y, Set.new)].max
      end
    end
    [n_max1, n_max2]
  end

  def color_at(x, y)
    return grid[y][x] if y >= 0 && y < grid.size && x >= 0 && x < grid[y].size

    -1
  end

  def neighbors(x, y)
    res = []
    POSITIONS.each do |(x_shift, y_shift)|
      if color_at(x+x_shift, y+y_shift) == color_at(x, y)
        res << [x+x_shift, y+y_shift]
      end
    end
    res
  end

  def recursive_dfs(x, y, visited)
    key = "#{x}-#{y}"
    return 0 if visited.include?(key)

    visited << key
    result = 1

    neighbors(x, y).each do |(x, y)|
      result += recursive_dfs(x, y, visited)
    end
    result
  end

  def iterative_dfs(x, y, visited)
    stack = [[x, y]]
    result = 0
    while stack.any?

      x, y = stack.pop

      key = "#{x}-#{y}"
      next if visited.include?(key)

      visited << key

      result += 1
      neighbors(x, y).each do |(x, y)|
        stack << [x, y]
      end
    end
    result
  end
end

grid = [[1, 0, 0, 1],
        [1, 1, 1, 1],
        [0, 1, 0, 0]]

p Grid.new(grid).max_connected_colors
# 7
