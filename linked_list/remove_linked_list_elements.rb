class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# tc1
node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(6)
node4 = ListNode.new(3)
node5 = ListNode.new(4)
node6 = ListNode.new(5)
node7 = ListNode.new(6)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7
head = node1
val = 6
# head = [1,2,6,3,4,5,6]
# Output: [1,2,3,4,5]

# tc2
# node1 = ListNode.new(7)
# node2 = ListNode.new(7)
# node3 = ListNode.new(7)
# node4 = ListNode.new(7)
# node1.next = node2
# node2.next = node3
# node3.next = node4
# head = node1
# val = 7
# head = [1,2,6,3,4,5,6]
# Output: [1,2,3,4,5]

# c1:
# def remove_elements(head, val)
#     curN = head
#     newHead = ListNode.new(-1)
#     curNewN = newHead

#     while(curN != nil)
#         if curN.val != val
#             curNewN.next = ListNode.new(curN.val)
#             curNewN = curNewN.next
#         end

#         curN = curN.next
#     end

#     newHead.next
# end

# c2:
# def remove_elements(head, val)
#     dummy = ListNode.new(-1)
#     dummy.next = head
#     preN = dummy
#     curN = head
#     nextN = nil

#     while(curN != nil)
#         if curN.val == val
#             # change linked
#             nextN = curN.next
#             preN.next = nextN
#         else
#             # increase preN
#             preN = preN.next
#         end

#         # always increase curN
#         curN = curN.next
#     end

#     dummy.next
# end

def remove_elements(head, val)
    dummy = ListNode.new(-1)
    dummy.next = head
    preN = dummy
    curN = head

    while(curN != nil)
        if curN.val == val
            preN.next = curN.next
        else
            preN = preN.next
        end

        curN = curN.next
    end

    dummy.next
end

pp remove_elements(head, val)