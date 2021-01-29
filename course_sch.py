import collections

class Solution:
    def canFinish(self, numCourses, prerequisites):
        graph = collections.defaultdict(list)
        for edge in prerequisites:
            graph[edge[0]].append(edge[1])

        visited = set()

        print(graph)

        # True if there is a cycle, False if not
        def visit(vertex):
            visited.add(vertex)
            print(visited, graph[vertex])
            for neighbour in graph[vertex]:
                if neighbour in visited or visit(neighbour):
                    return True

            visited.remove(vertex)
            return False

        for i in range(numCourses):
            if visit(i):
                return False

        return True


print(Solution().canFinish(2, [[0, 1]]))