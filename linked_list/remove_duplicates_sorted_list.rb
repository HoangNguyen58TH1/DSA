class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

node1 = ListNode.new(1)
node2 = ListNode.new(1)
node3 = ListNode.new(2)
node4 = ListNode.new(3)
node1.next = node2
node2.next = node3
node3.next = node4
head = node1

# c1
def delete_duplicates(head)
    curN = head

    while(curN != nil && curN.next != nil)
        if curN.val == curN.next.val
            curN.next = curN.next.next
        else
            curN = curN.next
        end
    end

    head
end

# c2
# def delete_duplicates(head)
#     return if head.nil?

#     newHead = ListNode.new(head.val)
#     curNew = newHead
#     curOld = head

#     while(curOld != nil)
#         if curOld.val != curNew.val
#             curNew.next = ListNode.new(curOld.val)
#             curNew = curNew.next
#         end
        
#         curOld = curOld.next
#     end

#     newHead
# end

pp delete_duplicates(head)
