class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# node1_1 = ListNode.new(1)
# node1_2 = ListNode.new(2)
# node1_3 = ListNode.new(4)
# node1_1.next = node1_2
# node1_2.next = node1_3
# list1 = node1_1

# node2_1 = ListNode.new(1)
# node2_2 = ListNode.new(3)
# node2_3 = ListNode.new(4)
# node2_1.next = node2_2
# node2_2.next = node2_3
# list2 = node2_1
# # Output: [1,1,2,3,4,4]

node1_1 = ListNode.new(-9)
node1_2 = ListNode.new(3)
node1_1.next = node1_2
list1 = node1_1

node2_1 = ListNode.new(5)
node2_2 = ListNode.new(7)
node2_1.next = node2_2
list2 = node2_1
# Output: [-9,3,5,7]

# c1: create new linked list
# def merge_two_lists(list1, list2)
#     return list1 if list2.nil?
#     return list2 if list1.nil?

#     cur1 = list1
#     cur2 = list2

#     dummy = ListNode.new(-1)
#     dummyNode = dummy

#     while(cur1 != nil && cur2 != nil)
#         if cur1.val <= cur2.val
#             dummyNode.next = ListNode.new(cur1.val)
#             cur1 = cur1.next
#         elsif cur1.val > cur2.val
#             dummyNode.next = ListNode.new(cur2.val)
#             cur2 = cur2.next
#         end
        
#         dummyNode = dummyNode.next
#     end

#     while(cur1 == nil && cur2 != nil)
#         dummyNode.next = ListNode.new(cur2.val)
#         cur2 = cur2.next
#         dummyNode = dummyNode.next
#     end

#     while(cur2 == nil && cur1 != nil)
#         dummyNode.next = ListNode.new(cur1.val)
#         cur1 = cur1.next
#         dummyNode = dummyNode.next
#     end

#     # dummyNode.next = cur1 || cur2 # maybe replace 2 while above

#     dummy.next
# end

# c2: update direct linked list list1 + list2
def merge_two_lists(list1, list2)
    cur1 = list1
    cur2 = list2
    dummy = ListNode.new(-1)
    dummyNode = dummy

    while(cur1 && cur2)
        if cur1.val <= cur2.val
            dummyNode.next = cur1
            cur1 = cur1.next
        else
            dummyNode.next = cur2
            cur2 = cur2.next
        end

        dummyNode = dummyNode.next
    end

    dummyNode.next = cur1 || cur2
    dummy.next
end

pp merge_two_lists(list1, list2)