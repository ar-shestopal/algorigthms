class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:

        # return if it has only one element
        if len(nums) == 1:
            return nums

        # count frequencies
        counter = {}
        for n in nums:
            if counter.get(n):
                counter[n] += 1
            else:
                counter[n] = 1

            # fins k top frequent with heap
        h = []
        for i, c in counter.items():
            if len(h) < k:
                heappush(h, (c, i))
            else:
                heappushpop(h, (c, i))

            # form result list from touples in the heap
        res = []
        for c, i in h:
            res.append(i)

        return res
