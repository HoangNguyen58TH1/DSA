class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
node6 = ListNode.new(6)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
head = node1
# Output: [4,5,6]

# c1: Traverse through the whole linked list:
# def middle_node(head)
#     curN = head
#     count = 0

#     while(curN != nil)
#         count += 1
#         curN = curN.next
#     end

#     middle = count/2 + 1
#     middleN = head

#     while(middleN != nil && middle != 1)
#         middle -= 1

#         middleN = middleN.next
#     end

#     middleN
# end

# c2: Traverse through + fast & slow:
# def middle_node(head)
#     curN = head
#     middleN = head
#     count = 0

#     while(curN != nil)
#         count += 1
#         curN = curN.next
#         middleN = middleN.next if count%2 == 0
#     end

#     middleN
# end

# c3: fast & slow
def middle_node(head)
    curN = head
    middleN = head

    while(curN != nil && curN.next != nil)
        curN = curN.next.next
        middleN = middleN.next
    end

    middleN
end

pp middle_node(head)


1 --> 2 --> 3 --> 4 --> 5
pointer_1 = pointer_1.next
pointer_2 = pointer_2.next.next