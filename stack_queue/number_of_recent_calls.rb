# c1: queue = array
# class RecentCounter
#     def initialize()
#         @queue = []
#     end

#     attr_accessor :queue

#     def ping(t)
#         queue.push(t)
#         while queue.first < t - 3000
#             queue.shift
#         end

#         queue.size
#     end
# end

# c2: queue = linked list
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

class RecentCounter
    def initialize()
        @head = nil
        @tail = nil
        @size = 0
    end

    def ping(t)
        new_node = ListNode.new(t)
        if (@head.nil?)
            @head = new_node
            @tail = new_node
        else
            @tail.next = new_node
            @tail = new_node
        end
        @size += 1

        while(@head && @head.val < t - 3000)
            @size -= 1
            @head = @head.next
        end

        @size
    end
end

obj = RecentCounter.new()
param_1 = obj.ping(1)
# pp [param_1]
param_2 = obj.ping(200)
param_3 = obj.ping(8000)
pp [param_1, param_2, param_3]
