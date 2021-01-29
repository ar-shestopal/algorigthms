N = 4

# A utility function to print solution matrix sol
def printSolution( sol )
  sol.each do |row|
    puts(row.to_s)
  end
end

def isSafe( maze, x, y )
  return true if x >= 0 and x < N and y >= 0 and y < N and maze[x][y] == 1

  false
end

def solveMaze( maze )

  # Creating a 4 * 4 2-D list
  sol = Array.new(N, 0) { Array.new(N, 0) }

  if solveMazeUtil(maze, 0, 0, sol) == false
    puts("Solution doesn't exist")
    return false
  end

  printSolution(sol)
  true
end

def solveMazeUtil(maze, x, y, sol)

  # if (x, y is goal) return True
  if x == N - 1 and y == N - 1 and maze[x][y]==1
    sol[x][y] = 'A'
    return true
  end

  # Check if maze[x][y] is valid
  if isSafe(maze, x, y) == true
    # mark x, y as part of solution path
    sol[x][y] = '*'

    # Move forward in x direction
    return true if solveMazeUtil(maze, x + 1, y, sol) == true

    # If moving in x direction doesn't give solution
    # then Move down in y direction
    return true if solveMazeUtil(maze, x, y + 1, sol) == true


    # If none of the above movements work then
    # BACKTRACK: unmark x, y as part of solution path
    sol[x][y] = 0
    return false
  end
end

maze = [ [1, 0, 0, 0],
         [1, 1, 0, 1],
         [0, 1, 0, 0],
         [1, 1, 1, 1] ]

solveMaze(maze)