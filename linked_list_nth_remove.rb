require 'pry'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  first = head
  list_size = 1
  while head.next
    list_size += 1
    head = head.next
  end
  head = first

  index = list_size - n - 1
  return head if index.negative?

  i = 0
  rem_node = head

  loop do
    rem_node = rem_node.next
    i += 1
    break if i == index
  end

  rem_node.next = rem_node.next.next
  head
end

head  = ListNode.new(1)
first = head
head.next = ListNode.new(2)
head = head.next
head.next = ListNode.new(3)
head = head.next
head.next = ListNode.new(4)
head = head.next
head.next = ListNode.new(5)


def print_list(head)
  res = [head.val]
  while head.next
    head = head.next
    res << head.val
  end
  res
end

print_list(remove_nth_from_end(first, 2))

p print_list(first)