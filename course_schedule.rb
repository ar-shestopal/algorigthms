require 'set'

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  adj = create_graph(prerequisites)
  visited = Set.new

  puts adj.inspect

  (0...num_courses).each do |vert|
    if check_vertex(adj, vert, visited)
      return false
    end
  end

  true
end

def create_graph(prerequisites)
    adj = {}
    prerequisites.each do |req|
        cours = req[0]
        prereq = req[1]

        adj[cours] = [] unless adj[cours]

        adj[cours] << prereq
    end
    adj
end

def check_vertex(adj, vert, visited)
  visited << vert
  con = adj[vert]

  unless con
    visited.delete(vert)
    return false
  end

  con.each do |v|
    if visited.include?(v) || check_vertex(adj, v, visited)
      return true
    end
  end
  visited.delete(vert)
  false
end

p can_finish(2, [[1, 0]])