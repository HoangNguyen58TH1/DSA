# c1: use 2 queues
# class MyStack
#     def initialize()
#         @queue1 = []
#         @queue2 = []
#     end

#     attr_accessor :queue1, :queue2

#     def push(x)
#         if queue1.empty?
#             queue1.push(x)
#             while(!queue2.empty?)
#                 queue1.push(queue2.shift)
#             end
#         else
#             queue2.push(x)
#             while(!queue1.empty?)
#                 queue2.push(queue1.shift)
#             end
#         end
#     end

#     def pop()
#         queue = queue1.empty? ? queue2 : queue1
#         queue.shift
#     end

#     def top()
#         queue = queue1.empty? ? queue2 : queue1
#         queue.first
#     end

#     def empty()
#         queue1.empty? && queue2.empty?
#     end
# end

# myStack = MyStack.new();
# myStack.push(1);
# myStack.push(2);
# myStack.push(3);
# pp "myStack.queue1: #{myStack.queue1}"
# pp "myStack.queue2: #{myStack.queue2}"
# param1 = myStack.pop();
# param2 = myStack.pop();
# param3 = myStack.pop();
# param4 = myStack.empty();
# pp [nil, nil, nil, param1, param2, param3, param4]

# ------------------------------------------------------------

# c2: use 1 queue
class MyStack
    def initialize()
        @queue = []
    end

    attr_accessor :queue

    def push(x)
        queue.push(x)
        (queue.size - 1).times do
            queue.push(queue.shift)
        end
    end

    def pop()
        queue.shift
    end

    def top()
        queue.first
    end

    def empty()
        queue.empty?
    end
end

myStack = MyStack.new();
myStack.push(1);
myStack.push(2);
myStack.push(3);
pp "myStack.queue: #{myStack.queue}"
param1 = myStack.pop();
param2 = myStack.pop();
param3 = myStack.pop();
param4 = myStack.empty();
pp [nil, nil, nil, param1, param2, param3, param4]