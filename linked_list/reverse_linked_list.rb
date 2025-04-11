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
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
head = node1
# Output: [5,4,3,2,1]

def reverse_list(head)
    preN = nil
    curN = head

    while(curN != nil)
        nextN = curN.next
        curN.next = preN
        preN = curN
        curN = nextN
    end

    preN
end
pp reverse_list(head)
